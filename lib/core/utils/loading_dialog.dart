import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';
import '../extensions/theme_ext.dart';

void showLoadingDialog() async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) => const LoadingDialog(),
  );
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;

    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        height: 120.h,
        width: 120.w,
        child: Center(
          child: CircularProgressIndicator(color: kColors.primary),
          // Lottie.asset(
          //   AssetsManager.loadingAnimation,
          //   repeat: true,
          //   fit: BoxFit.fitWidth,
          // ),
        ),
      ),
    );
  }
}
