import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHelpers {
  static CustomText boldText({
    required String? text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return CustomText(
      text: text ?? "",
      type: TextType.bold,
      fontSize: fontSize ?? 14.0.sp,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  static CustomText largeText({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return CustomText(
      text: text,
      type: TextType.large,
      fontSize: fontSize ?? 28.0.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  static CustomText mediumText({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return CustomText(
      text: text,
      type: TextType.medium,
      fontSize: fontSize?.sp ?? 20.0.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  static CustomText regularText({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return CustomText(
      text: text,
      type: TextType.small,
      fontSize: fontSize ?? 16.0.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // static CustomText bodyMediumText({
  //   required String text,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  //   Color? color,
  //   TextAlign? textAlign,
  //   int? maxLines,
  //   TextOverflow? overflow,
  // }) {
  //   return CustomText(
  //     text: text,
  //     type: TextType.bodyMedium,
  //     fontSize: fontSize ?? 16.0.sp,
  //     fontWeight: fontWeight ?? FontWeight.w400,
  //     color: color,
  //     textAlign: textAlign ?? TextAlign.start,
  //     maxLines: maxLines,
  //     overflow: overflow,
  //   );
  // }

  // static CustomText bodySmallText({
  //   required String text,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  //   Color? color,
  //   TextAlign? textAlign,
  //   int? maxLines,
  //   TextOverflow? overflow,
  // }) {
  //   return CustomText(
  //     text: text,
  //     type: TextType.bodySmall,
  //     fontSize: fontSize ?? 14.0.sp,
  //     fontWeight: fontWeight ?? FontWeight.w400,
  //     color: color,
  //     textAlign: textAlign ?? TextAlign.start,
  //     maxLines: maxLines,
  //     overflow: overflow,
  //   );
  // }
}

enum TextType {
  bold,
  medium,
  large,
  small,
  bodyMedium,
  bodySmall,
}

class CustomText extends StatelessWidget {
  final String text;
  final TextType? type;
  final TextStyle? style;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextDecorationStyle? decorationStyle;
  final List<Shadow>? shadows;

  const CustomText({
    super.key,
    required this.text,
    this.type,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
    this.decorationStyle,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle baseStyle;

    switch (type) {
      case TextType.bold:
        baseStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            );
        break;
      case TextType.medium:
        baseStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            );
        break;
      case TextType.large:
        baseStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            );
        break;
      case TextType.small:
        baseStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            );
        break;
      case TextType.bodyMedium:
        baseStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            );
        break;
      case TextType.bodySmall:
        baseStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            );
        break;
      default:
        baseStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            );
    }

    return Text(
      text,
      style: baseStyle.copyWith(
        fontFamily: 'Poppins',
        fontSize: fontSize ?? baseStyle.fontSize,
        fontWeight: fontWeight ?? baseStyle.fontWeight,
        color: color ?? baseStyle.color,
        decoration: decoration ?? baseStyle.decoration,
        decorationColor: decorationColor ?? baseStyle.decorationColor,
        decorationThickness:
            decorationThickness ?? baseStyle.decorationThickness,
        decorationStyle: decorationStyle ?? baseStyle.decorationStyle,
        shadows: shadows ?? baseStyle.shadows,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
