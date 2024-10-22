import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/shared_widgets/custom_button.dart';
import '../../../core/theme/custom_text_styles.dart';
import '../../../core/utils/assets_manager.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.arLanguageicon),
              Gap(4.w),
              TextHelpers.mediumText(
                text: onboardingModel.title,
                fontSize: 12,
              ),
            ],
          ),
        ),
        Gap(44.h),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 38.w),
              child: SizedBox(height: 432.h),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Positioned(
                bottom: 0,
                child: Column(
                  children: [
                    TextHelpers.mediumText(
                      text: onboardingModel.descriptionTitle,
                      fontSize: 24,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    Gap(8.h),
                    TextHelpers.regularText(
                      text: onboardingModel.descriptionBody,
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
        MaxGap(1.sh),
        onboardingModel.currentStep != 0
            ? Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                child: CustomButton(
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    title: "Previous"),
              )
            : const SizedBox(),
      ],
    );
  }
}
