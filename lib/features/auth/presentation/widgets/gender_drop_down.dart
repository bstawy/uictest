import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/navigation_ext.dart';
import '../../../../core/extensions/theme_ext.dart';
import '../../../../core/shared_widgets/custom_input_field.dart';
import '../../../../core/shared_widgets/frosted_effect_widget.dart';
import '../../../../core/shared_widgets/gradient_elevated_button.dart';
import '../../../../core/theme/custom_colors.dart';
import '../../../../core/theme/custom_text_styles.dart';
import '../../../../core/utils/get_configs.dart';
import '../../../../core/utils/validators.dart';
import '../../../../generated/l10n.dart';
import '../sign_up/cubit/sign_up_cubit.dart';

class GenderModel {
  int? id;
  String? titleEn;
  String? titleAr;

  GenderModel({
    this.id,
    this.titleEn,
    this.titleAr,
  });
}

class GenderDropDown extends StatefulWidget {
  const GenderDropDown({super.key});

  @override
  State<GenderDropDown> createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  late final TextEditingController _genderController;
  int selectedOption = 0;
  final List<GenderModel> genders = [];

  @override
  void initState() {
    super.initState();
    _genderController = TextEditingController(
      text: context.read<SignUpCubit>().signUpRequestModel.gender ?? '',
    );
    genders.addAll([
      GenderModel(
        id: 0,
        titleEn: "Male",
        titleAr: "ذكر",
      ),
      GenderModel(
        id: 1,
        titleEn: "Female",
        titleAr: "أنثى",
      ),
    ]);
  }

  @override
  void dispose() {
    _genderController.dispose();
    super.dispose();
  }

  void _openGenderPicker(final SignUpCubit signUpCubit) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final locale = S.of(context);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Column(
                children: [
                  Gap(8.h),
                  Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  Gap(32.h),
                  InkWell(
                    onTap: () {
                      setModalState(() {
                        selectedOption = genders[0].id!;

                        _genderController.text =
                            GetConfigs.isArabicLanguage(context)
                                ? genders[0].titleAr!
                                : genders[0].titleEn!;
                        signUpCubit.signUpRequestModel.gender =
                            _genderController.text;
                      });
                    },
                    borderRadius: BorderRadius.circular(16.r),
                    child: _buildDialogItem(
                      genders[0].id!,
                      GetConfigs.isArabicLanguage(context)
                          ? genders[0].titleAr!
                          : genders[0].titleEn!,
                      selectedOption == genders[0].id!,
                    ),
                  ),
                  Gap(10.h),
                  InkWell(
                    onTap: () {
                      setModalState(() {
                        selectedOption = genders[1].id!;
                        _genderController.text =
                            GetConfigs.isArabicLanguage(context)
                                ? genders[1].titleAr!
                                : genders[1].titleEn!;
                      });
                    },
                    borderRadius: BorderRadius.circular(16.r),
                    child: _buildDialogItem(
                      genders[1].id!,
                      GetConfigs.isArabicLanguage(context)
                          ? genders[1].titleAr!
                          : genders[1].titleEn!,
                      selectedOption == genders[1].id!,
                    ),
                  ),
                  Gap(16.h),
                  GradientElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    title: locale.confirm,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDialogItem(int genderId, String gender, bool isSelected) {
    return FrostedEffect(
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: isSelected ? null : context.colors.surfaceContainerHighest,
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    CustomColors.lightPurple.withOpacity(0.15),
                    Colors.white.withOpacity(0.15),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                )
              : null,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: CustomColors.lightPurple,
          ),
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: TextHelpers.mediumText(
          text: gender,
          fontSize: 12,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return Stack(
      children: [
        CustomInputField(
          controller: _genderController,
          hint: locale.gender,
          readOnly: true,
          validator: (value) => Validators.validateNotEmpty(
            title: locale.gender,
            value: value,
          ),
          suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
        ),
        InkWell(
          onTap: () => _openGenderPicker(
            context.read<SignUpCubit>(),
          ),
          borderRadius: BorderRadius.circular(15.r),
          child: SizedBox(
            height: 60.h,
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
