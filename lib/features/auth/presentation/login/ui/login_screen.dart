import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../app_config_cubit/app_config_cubit.dart';
import '../../../../../core/extensions/navigation_ext.dart';
import '../../../../../core/extensions/theme_ext.dart';
import '../../../../../core/services_locator/services_locator.dart';
import '../../../../../core/shared_widgets/patterned_scaffold.dart';
import '../../../../../core/theme/custom_text_styles.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';
import '../../sign_up/cubit/sign_up_cubit.dart';
import '../../sign_up/ui/sign_up_screen.dart';
import 'widgets/login_form.dart';
import 'widgets/login_social_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return PatternedScaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          _guestButtonWidget(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Gap(40.h),
                TextHelpers.mediumText(
                  text: locale.login,
                  fontSize: 24,
                  textAlign: TextAlign.center,
                ),
                Gap(16.h),
                Image.asset(
                  context.read<AppConfigCubit>().themeIsDark
                      ? AssetsManager.uicFullLogoDark
                      : AssetsManager.uicFullLogo,
                  width: 217.w,
                  height: 96.h,
                ),
                Gap(32.h),
                const LoginForm(),
                Gap(32.h),
                _loginWithDivider(locale),
                Gap(16.h),
                const LoginSocialWidget(),
                Gap(24.h),
                InkWell(
                  onTap: () {
                    context.pushAnimated(
                      BlocProvider(
                        create: (context) => getIt<SignUpCubit>(),
                        child: const SignUpScreen(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(50.r),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "${locale.dont_have_account} ${locale.sign_up}",
                        style: TextStyle(
                          color: context.colors.onPrimary,
                          fontSize: 14.sp,
                          decoration:
                              TextDecoration.underline, // Underline the text
                          decorationColor:
                              context.colors.primary, // Set the underline color
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginWithDivider(final S locale) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Gap(8.w),
          Text(
            locale.or_login_with,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
          Gap(8.w),
          const Expanded(
            child: Divider(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _guestButtonWidget() {
    final kColors = navKey.currentContext!.colors;
    final locale = S.of(navKey.currentContext!);

    return Padding(
      padding: EdgeInsetsDirectional.only(top: 20.h, end: 24.w),
      child: InkWell(
        onTap: () {
          navKey.currentState!.context.read<AppConfigCubit>().changeTheme();
        },
        borderRadius: BorderRadius.circular(8.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsManager.usersIcon,
              height: 16.h,
              width: 16.w,
              colorFilter: ColorFilter.mode(
                kColors.primaryFixed,
                BlendMode.srcIn,
              ),
            ),
            Gap(4.w),
            TextHelpers.mediumText(
              text: locale.guest,
              fontSize: 10,
              color: kColors.primaryFixed,
            ),
          ],
        ),
      ),
    );
  }
}
