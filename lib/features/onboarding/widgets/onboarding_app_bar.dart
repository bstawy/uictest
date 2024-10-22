import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/custom_text_styles.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../cubit/app_config_cubit.dart';
import 'language_model.dart';

class OnboardingAppBar extends StatefulWidget implements PreferredSizeWidget {
  const OnboardingAppBar({super.key});

  @override
  State<OnboardingAppBar> createState() => _OnboardingAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _OnboardingAppBarState extends State<OnboardingAppBar> {
  final List<LanguageModel> languages = [];
  final List<DropdownMenuItem> _items = [];
  String selectedLanguage = '';

  @override
  void initState() {
    super.initState();
    languages.addAll([
      LanguageModel(
        title: 'EN',
        value: 'en',
        iconPath: AssetsManager.enLanguageicon,
      ),
      LanguageModel(
        title: 'AR',
        value: 'ar',
        iconPath: AssetsManager.arLanguageicon,
      ),
    ]);

    _items.addAll(
      languages.map(
        (e) => DropdownMenuItem(
          value: e.value,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: SvgPicture.asset(
                  e.iconPath,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(8.w),
              Text(e.title),
            ],
          ),
        ),
      ),
    );

    selectedLanguage = _items.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100.w,
      leading: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 20.h,
          start: 16.w,
        ),
        child: DropdownButton(
          items: _items,
          value: selectedLanguage,
          onChanged: (value) {
            setState(() {
              selectedLanguage = value.toString();
            });
          },
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: 20.h,
            end: 16.w,
          ),
          child: TextButton(
            onPressed: () {
              context.read<AppConfigCubit>().changeTheme();
            },
            child: TextHelpers.mediumText(
              text: "skip",
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
