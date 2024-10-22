import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../app_config_cubit/app_config_cubit.dart';
import '../../../core/extensions/navigation_ext.dart';
import '../../../core/extensions/theme_ext.dart';
import '../../../core/services_locator/services_locator.dart';
import '../../../core/theme/custom_text_styles.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../generated/l10n.dart';
import '../../auth/presentation/login/cubit/login_cubit.dart';
import '../../auth/presentation/login/ui/login_screen.dart';
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
    selectedLanguage = context.read<AppConfigCubit>().currentLanguage;
  }

  void _fillLanguagesList(final locale) {
    if (languages.isNotEmpty) {
      languages.clear();
    }
    languages.addAll([
      LanguageModel(
        title: locale.en,
        value: 'en',
        iconPath: AssetsManager.enLanguageIcon,
      ),
      LanguageModel(
        title: locale.ar,
        value: 'ar',
        iconPath: AssetsManager.arLanguageIcon,
      ),
    ]);
  }

  void _fillLanguageDropDown() {
    if (_items.isNotEmpty) {
      _items.clear();
    }
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
  }

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;
    final locale = S.of(context);
    _fillLanguagesList(locale);
    _fillLanguageDropDown();

    return AppBar(
      leadingWidth: 135.w,
      backgroundColor: Colors.transparent,
      forceMaterialTransparency: true,
      leading: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 20.h,
          start: 16.w,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            items: _items,
            value: selectedLanguage,
            onChanged: (value) {
              log(value.toString());
              setState(() {
                selectedLanguage = value.toString();
                context.read<AppConfigCubit>().changeLanguage(value.toString());
              });
            },
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => context.read<AppConfigCubit>().changeTheme(),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              top: 20.h,
              end: 16.w,
            ),
            child: SvgPicture.asset(
              "assets/icons/theme_icon.svg",
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                kColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: 20.h,
            end: 16.w,
          ),
          child: TextButton(
            onPressed: () {
              context.pushReplacementAnimated(
                BlocProvider<LoginCubit>(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ),
              );
            },
            child: TextHelpers.mediumText(
              text: locale.skip,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
