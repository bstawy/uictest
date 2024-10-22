import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/shared_widgets/custom_input_field.dart';
import '../../../../../../core/theme/custom_text_styles.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../../../generated/l10n.dart';
import '../../../widgets/gender_drop_down.dart';
import '../../../widgets/nationality_drop_down.dart';
import '../../cubit/sign_up_cubit.dart';

class SignUpPersonalDetails extends StatefulWidget {
  const SignUpPersonalDetails({super.key});

  @override
  State<SignUpPersonalDetails> createState() => _SignUpPersonalDetailsState();
}

class _SignUpPersonalDetailsState extends State<SignUpPersonalDetails> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  String? selectedNationality;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    _formKey = context.read<SignUpCubit>().signUpPersonalDetailsformKey;
    _nameController = TextEditingController(
        text: context.read<SignUpCubit>().signUpRequestModel.name ?? '');
    _emailController = TextEditingController(
        text:
            context.read<SignUpCubit>().signUpRequestModel.emailAddress ?? '');
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Gap(50.h),
            TextHelpers.mediumText(
              text: locale.personal_details,
              fontSize: 24,
              textAlign: TextAlign.center,
            ),
            Gap(16.h),
            CustomInputField(
              controller: _nameController,
              hint: locale.name,
              validator: (value) => Validators.validateNotEmpty(
                title: locale.name,
                value: value,
              ),
              onChanged: (value) {
                context.read<SignUpCubit>().signUpRequestModel.name = value;
              },
            ),
            Gap(16.h),
            // CustomInputField(
            //   controller: _middleNameController,
            //   hint: locale.middle_name,
            //   validator: (value) => Validators.validateNotEmpty(
            //     title: locale.middle_name,
            //     value: value,
            //   ),
            //   onChanged: (value) {
            //     context.read<SignUpCubit>().signUpRequestModel.name =
            //         "${_firstNameController.text} $value ${_lastNameController.text}";
            //   },
            // ),
            // Gap(16.h),
            // CustomInputField(
            //   controller: _lastNameController,
            //   hint: locale.last_name,
            //   validator: (value) => Validators.validateNotEmpty(
            //     title: locale.last_name,
            //     value: value,
            //   ),
            //   onChanged: (value) {
            //     context.read<SignUpCubit>().signUpRequestModel.name =
            //         "${_firstNameController.text} ${_middleNameController.text} $value";
            //   },
            // ),
            // Gap(16.h),
            CustomInputField(
              controller: _emailController,
              hint: locale.email,
              validator: Validators.validateEmail,
              onChanged: (value) {
                context.read<SignUpCubit>().signUpRequestModel.emailAddress =
                    value;
              },
            ),
            Gap(16.h),
            const NationalityDropDown(),
            // DropDownWidget(
            //   items: const ['Saudi', 'Bahraini'],
            //   hint: locale.nationality,
            //   onChanged: (value) {
            //     context.read<SignUpCubit>().signUpRequestModel.nationality =
            //         value.toString();
            //   },
            // ),
            Gap(16.h),
            const GenderDropDown()
            // DropDownWidget(
            //   items: const ['Male', 'Female'],
            //   hint: locale.gender,
            //   onChanged: (value) {
            //     context.read<SignUpCubit>().signUpRequestModel.gender =
            //         value.toString();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
