import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/extensions/theme_ext.dart';
import '../../../../../../core/theme/custom_text_styles.dart';
import '../../../../../../generated/l10n.dart';

class SignUpOtpVerification extends StatelessWidget {
  const SignUpOtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;
    final locale = S.of(context);

    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
        color: kColors.primaryFixed,
        fontSize: 24.sp,
      ),
      decoration: BoxDecoration(
        color: kColors.surface,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: kColors.primary,
          width: 1.w,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(50.h),
          TextHelpers.mediumText(
            text: locale.otp_verification,
            fontSize: 24,
            textAlign: TextAlign.center,
          ),
          Gap(8.h),
          TextHelpers.regularText(
            text: locale.enter_otp_sent_to_phone,
            fontSize: 14,
            textAlign: TextAlign.center,
            color: kColors.onInverseSurface,
          ),
          Gap(40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Pinput(
              defaultPinTheme: defaultPinTheme,
              length: 4,
              onCompleted: (pin) {},
            ),
          ),
          Gap(40.h),
          TextHelpers.regularText(
            text: locale.didnt_receive_otp,
            fontSize: 14,
            textAlign: TextAlign.center,
            color: kColors.onInverseSurface,
          ),
          Gap(8.h),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50.r),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: locale.resend_code,
                style: TextStyle(
                  color: context.colors.primaryFixed,
                  fontSize: 12.sp,
                  decoration: TextDecoration.underline, // Underline the text
                  decorationColor:
                      context.colors.primary, // Set the underline color
                ),
              ),
            ),
          ),
          Gap(32.h),
        ],
      ),
    );
  }
}
