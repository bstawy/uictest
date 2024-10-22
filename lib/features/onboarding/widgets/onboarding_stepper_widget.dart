import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/extensions/theme_ext.dart';

class OnboardingStepperWidget extends StatelessWidget {
  final int currentStep;

  const OnboardingStepperWidget({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          _step(context, currentStep >= 0),
          Gap(4.w),
          _step(context, currentStep >= 1),
          Gap(4.w),
          _step(context, currentStep >= 2),
          Gap(4.w),
          _step(context, currentStep >= 3),
          Gap(4.w),
          _step(context, currentStep >= 4),
          Gap(4.w),
          _step(context, currentStep >= 5),
          Gap(4.w),
          _step(context, currentStep >= 6),
        ],
      ),
    );
  }

  Widget _step(BuildContext context, bool isFinished) {
    final kColors = context.colors;

    return Expanded(
      child: Container(
        height: 5.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: isFinished
              ? const LinearGradient(
                  colors: [
                    Color(0xFF6B47F5),
                    Color(0xFFBDACFF),
                  ],
                )
              : null,
          color: isFinished ? null : kColors.surfaceContainer,
        ),
      ),
    );
  }
}
