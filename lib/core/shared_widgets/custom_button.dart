import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/theme_ext.dart';
import '../theme/custom_colors.dart';
import '../theme/custom_text_styles.dart';

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
  final Widget? prefixIcon, suffixIcon;
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
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (prefixIcon != null) prefixIcon!,
          const Spacer(),
          TextHelpers.mediumText(
            text: title,
            fontSize: 14,
            color: kColors.primary,
          ),
          const Spacer(),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}
