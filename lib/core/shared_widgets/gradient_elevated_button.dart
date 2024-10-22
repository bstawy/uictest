import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientElevatedButton extends StatelessWidget {
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
  final List<Color>? gradientColors;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const GradientElevatedButton({
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
    this.gradientColors,
    this.borderColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadiusValue ?? 16.r),
      type: MaterialType.button,
      elevation: elevation ?? 6,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors ??
                [
                  const Color(0xFF3F3A60),
                  const Color(0xFF6B47F5),
                ],
          ),
          borderRadius: BorderRadius.circular(borderRadiusValue ?? 16.r),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: padding ??
                EdgeInsets.symmetric(
                  vertical: paddingVertical ?? 14.h,
                  horizontal: paddingHorizontal ?? 16.w,
                ),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 16.r),
              side: BorderSide(
                color: borderColor ?? Colors.white.withOpacity(0.4),
                width: borderWidth ?? 1.r,
              ),
            ),
            minimumSize: Size(minWidth ?? 1.sw, minHeight ?? 44.h),
          ),
          child: Text(
            title,
            style: titleStyle ??
                const TextStyle(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
