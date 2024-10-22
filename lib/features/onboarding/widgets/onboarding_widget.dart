import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../app_config_cubit/app_config_cubit.dart';
import '../../../core/extensions/theme_ext.dart';
import '../../../core/shared_widgets/custom_button.dart';
import '../../../core/shared_widgets/frosted_effect_widget.dart';
import '../../../core/theme/custom_text_styles.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../generated/l10n.dart';
import 'onboarding_model.dart';

class OnboardingWidget extends StatelessWidget {
  final PageController pageController;
  final OnboardingModel onboardingModel;

  const OnboardingWidget({
    super.key,
    required this.pageController,
    required this.onboardingModel,
  });

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;
    final locale = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.arLanguageIcon),
              Gap(4.w),
              TextHelpers.mediumText(
                text: onboardingModel.titleLocaleKey,
                fontSize: 12,
              ),
            ],
          ),
        ),
        Gap(30.h),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 38.w, end: 38.w, top: 24.h),
              child: Container(
                height: 450.h,
                alignment: Alignment.center,
                child: Image.asset(
                  context.read<AppConfigCubit>().themeIsDark
                      ? onboardingModel.darkImagePath
                      : onboardingModel.imagePath,
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  children: [
                    TextHelpers.mediumText(
                      text: onboardingModel.descriptionTitleLocaleKey,
                      fontSize: 24,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    Gap(8.h),
                    TextHelpers.regularText(
                      text: onboardingModel.descriptionBodyLocaleKey,
                      fontSize: 14,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        MaxGap(20.h),
        onboardingModel.currentStep != 0
            ? Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                child: FrostedEffect(
                  child: CustomButton(
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    title: locale.previous,
                    backgroudnColor: kColors.surfaceContainerHigh,
                    // kColors.inversePrimary,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
