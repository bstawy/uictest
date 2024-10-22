import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/extensions/theme_ext.dart';
import '../../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../../core/shared_widgets/frosted_effect_widget.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/error_dialog.dart';
import '../../../../../../core/utils/loading_dialog.dart';
import '../../../../../../core/utils/success_dialog.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/login_cubit.dart';

class LoginSocialWidget extends StatelessWidget {
  const LoginSocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is GoogleSignInLoading || state is AppleSignInLoading) {
          showLoadingDialog();
        } else if (state is GoogleSignInSuccess ||
            state is AppleSignInSuccess) {
          showSuccessDialog();
        } else if (state is GoogleSignInError || state is AppleSignInError) {
          final errorMessage = state is GoogleSignInError
              ? state.error.message
              : (state as AppleSignInError).error.message;
          showErrorDialog(errorMessage);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            LoginSocialButton(
              title: locale.continue_with_google,
              iconPath: AssetsManager.googleIcon,
              onPressed: () {
                context.read<LoginCubit>().loginWithGoogle();
              },
            ),
            Gap(8.h),
            LoginSocialButton(
              title: locale.continue_with_facebook,
              iconPath: AssetsManager.facebookIcon,
              onPressed: () {
                // TODO: Implement facebook login
              },
            ),
            Gap(8.h),
            LoginSocialButton(
              title: locale.continue_with_apple,
              iconPath: AssetsManager.appleIcon,
              onPressed: () {
                context.read<LoginCubit>().loginWithApple();
              },
            ),
          ],
        );
      },
    );
  }
}

class LoginSocialButton extends StatelessWidget {
  final String title;
  final String? iconPath;
  final VoidCallback onPressed;

  const LoginSocialButton({
    super.key,
    required this.title,
    this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;

    return FrostedEffect(
      child: CustomButton(
        onPressed: () {
          onPressed();
        },
        title: title,
        prefixIcon: iconPath != null
            ? SvgPicture.asset(
                iconPath!,
                width: 20.w,
                height: 20.h,
              )
            : null,
        backgroudnColor: kColors.surfaceContainerHigh,
        borderColor: kColors.onInverseSurface.withOpacity(0.5),
      ),
    );
  }
}
