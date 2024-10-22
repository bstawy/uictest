import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/extensions/navigation_ext.dart';
import '../../core/shared_widgets/gradient_elevated_button.dart';
import '../onboarding/onboarding_screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: const Center(
          // TODO: replace with logo image
          child: Text(
            "Splash Screen",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          bottom: 40.0.h,
          left: 16.0.w,
          right: 16.0.w,
        ),
        child: GradientElevatedButton(
          onPressed: () {
            context.pushAnimated(const OnboardingScreens());
          },
          title: "Get Started",
        ),
      ),
    );
  }

  void getStartedOnTap(BuildContext context) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text('Continue button pressed'),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('Dismiss'),
          ),
        ],
      ),
    );
  }
}
