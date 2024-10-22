import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extensions/theme_ext.dart';

class CustomStepperWidget extends StatelessWidget {
  final int stepsNumber;
  final int currentStep;
  final double? stepHeight;
  final Color? unfinishedStepColor;

  const CustomStepperWidget({
    super.key,
    required this.stepsNumber,
    required this.currentStep,
    this.stepHeight,
    this.unfinishedStepColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        stepsNumber,
        (index) => _step(
          context,
          index <= currentStep,
          isLast: index == stepsNumber - 1,
        ),
      ),
    );
  }

  Widget _step(BuildContext context, bool isFinished, {bool isLast = false}) {
    final kColors = context.colors;

    return Expanded(
      child: Container(
        height: stepHeight ?? 8.0.h,
        margin: EdgeInsetsDirectional.only(
          end: isLast ? 0 : 4.w,
        ),
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
          color: isFinished
              ? null
              : (unfinishedStepColor ?? kColors.surfaceContainer),
        ),
      ),
    );
  }
}
