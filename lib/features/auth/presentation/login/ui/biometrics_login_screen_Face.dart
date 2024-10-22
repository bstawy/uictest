import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../../core/extensions/navigation_ext.dart';
import '../../../../../core/extensions/theme_ext.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/gradient_elevated_button.dart';
import '../../../../../core/shared_widgets/patterned_scaffold.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../generated/l10n.dart';
import '../../../../layout/presentation/ui/layout_screen.dart';
import '../cubit/Biometric/biometric_cubit.dart';
import 'widgets/biometrics_login_widget.dart';

class BiometricsLoginScreenFace extends StatefulWidget {
  const BiometricsLoginScreenFace({super.key});

  @override
  State<BiometricsLoginScreenFace> createState() =>
      _BiometricsLoginScreenFaceState();
}

class _BiometricsLoginScreenFaceState extends State<BiometricsLoginScreenFace> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    _checkBiometricSupport();
  }

  Future<void> _checkBiometricSupport() async {
    try {
      final availableBiometrics =
          await LocalAuthentication().isDeviceSupported();
      debugPrint("Available Biometrics: $availableBiometrics"); // Detailed log
    } catch (e) {
      debugPrint('Error checking biometrics: $e');
    }
  }

  bool? canCheckBiometrics, isDeviceSupported, authenticated;
  Future<void> authenticateBiometric(BiometricType type) async {
    log('Authenticating with $type');
    canCheckBiometrics = await auth.canCheckBiometrics;
    var availableBiometrics = await auth.getAvailableBiometrics();
    log('availableBiometrics with $availableBiometrics'); // not able to receive this value in some of the devices, hence not considering into to the check
    isDeviceSupported = await auth.isDeviceSupported();
    try {
      if (canCheckBiometrics! && isDeviceSupported!) {
        authenticated = await auth.authenticate(
          localizedReason: 'Authenticate to access your account',
          options: const AuthenticationOptions(
            stickyAuth:
                true, // Keeps the authentication alive longer during the session
            biometricOnly:
                true, // Ensures only biometric methods are used for authentication
            useErrorDialogs: true, // Shows an error dialog for auth errors
          ),
        );
        if (authenticated!) {
          if (mounted) {
            context.read<BiometricCubit>().toggleFingerprint(true);
            context.pushReplacement(const LayoutScreen());
          }
        } else {
          log("2 ===========> not recognized");
        }
      } else {
        debugPrint(
            "Show message if there is no any device support configuration available");
      }
    } catch (e) {
      log("4 =====>");
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final kColors = context.colors;
    return PatternedScaffold(
      body: SafeArea(
        child: BiometricsLoginWidget(
          title: locale.face_id,
          descriptionTitle: locale.face_id_enabling_message,
          descriptionBody: locale.enable_from_settings_message,
          imagePath: AssetsManager.faceIdImage,
          darkImagePath: AssetsManager.faceIdImageDark,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 8.h,
          bottom: 40.0.h,
          left: 16.0.w,
          right: 16.0.w,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () {
                  context.pop();
                },
                title: locale.not_now,
                backgroudnColor: kColors.surfaceContainerHigh.withOpacity(0.4),
                borderColor: kColors.onInverseSurface.withOpacity(0.5),
              ),
            ),
            Gap(8.w),
            Expanded(
              child: GradientElevatedButton(
                onPressed: () async {
                  await authenticateBiometric(BiometricType.face);
                },
                title: locale.enable,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
