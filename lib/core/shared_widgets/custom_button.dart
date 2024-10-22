import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final double? minWidth,
      minHeight,
      elevation,
      borderRadiusValue,
      borderWidth,
      paddingVertical,
      paddingHorizontal;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor, backgroudnColor;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.title,
    this.titleStyle,
    this.minWidth,
    this.minHeight,
    this.elevation,
    this.borderRadiusValue,
    this.borderWidth,
    this.paddingVertical,
    this.paddingHorizontal,
    this.padding,
    this.borderColor,
    this.backgroudnColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: paddingVertical ?? 14.h,
              horizontal: paddingHorizontal ?? 16.w,
            ),
        backgroundColor: backgroudnColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue ?? 16.r),
          side: BorderSide(
            color: borderColor ?? CustomColors.purple,
            width: borderWidth ?? 1.r,
          ),
        ),
        minimumSize: Size(minWidth ?? 1.sw, minHeight ?? 44.h),
      ),
      child: Text(
        title,
        style: titleStyle ??
            const TextStyle(
              color: CustomColors.purple,
            ),
      ),
    );
  }
}
