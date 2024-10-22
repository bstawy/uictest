import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/extensions/navigation_ext.dart';
import '../../core/shared_widgets/patterned_scaffold.dart';
import '../../core/utils/assets_manager.dart';
import '../onboarding/onboarding_screens.dart';

class SplashScreen extends StatefulWidget {
  final bool isDark;
  const SplashScreen({super.key, required this.isDark});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final LocalAuthentication _auth = LocalAuthentication();
  // bool isBiometricEnabled = false;

  String logo = '';

  // Future<bool> checkBiometric() async {
  //   return await CachingPrefsFactory.readBool(
  //           AppConstants.cachingBiometricsKey) ??
  //       false;
  // }

  // loginWithBiometrics() async {
  //   if (await checkBiometric()) {
  //     final bool canAuthWithBiometrics = await _auth.canCheckBiometrics;

  //     if (canAuthWithBiometrics) {
  //       try {
  //         final bool didAuthenticate = await _auth.authenticate(
  //           localizedReason: 'Please authenticate to continue',
  //           options: const AuthenticationOptions(
  //             biometricOnly: true,
  //           ),
  //         );

  //         isBiometricEnabled = didAuthenticate;
  //       } on PlatformException catch (e) {
  //         isBiometricEnabled = false;

  //         final locale = S.of(context);

  //         String errorMessage;
  //         if (e.code == 'NotAvailable') {
  //           errorMessage = locale.biometric_not_available;
  //         } else if (e.code == 'NotEnrolled') {
  //           errorMessage = locale.no_biometric_credentials;
  //         } else {
  //           errorMessage = locale.unknown_error_occurred;
  //         }

  //         debugPrint(e.toString());
  //         showErrorDialog(errorMessage);
  //       } catch (e) {
  //         isBiometricEnabled = false;
  //         debugPrint(e.toString());
  //         showErrorDialog(e.toString());
  //       }
  //     }
  //   } else {
  //     isBiometricEnabled = false;
  //   }
  // }

  @override
  void initState() {
    super.initState();
    logo = widget.isDark
        ? AssetsManager.uicFullLogoDark
        : AssetsManager.uicFullLogo;

    Future.delayed(const Duration(seconds: 3), () async {
      if (mounted) {
        context.pushReplacementAnimated(const OnboardingScreens());
      }
      // await loginWithBiometrics();
      // if (mounted) {
      //   if (isBiometricEnabled) {
      //     context.pushReplacementAnimated(const HomeScreen());
      //   } else {
      //     context.pushReplacementAnimated(const OnboardingScreens());
      //   }
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PatternedScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 43.w),
        child: Center(
          child: Image.asset(logo),
        ),
      ),
    );
  }
}
