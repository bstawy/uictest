import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/custom_text_styles.dart';
import '../../../../../../core/utils/get_configs.dart';

class BiometricsLoginWidget extends StatelessWidget {
  final String title;
  final String descriptionTitle;
  final String descriptionBody;
  final String imagePath;
  final String darkImagePath;

  const BiometricsLoginWidget({
    super.key,
    required this.title,
    required this.descriptionTitle,
    required this.descriptionBody,
    required this.imagePath,
    required this.darkImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextHelpers.mediumText(
            text: title,
            fontSize: 24,
            textAlign: TextAlign.center,
          ),
          Gap(40.h),
          Image.asset(
            GetConfigs.themeIsDark(context) ? darkImagePath : imagePath,
            width: 144.w,
            height: 144.h,
          ),
          Gap(40.h),
          TextHelpers.mediumText(
            text: descriptionTitle,
            fontSize: 16,
            textAlign: TextAlign.center,
          ),
          Gap(16.h),
          TextHelpers.regularText(
            text: descriptionBody,
            fontSize: 12,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
