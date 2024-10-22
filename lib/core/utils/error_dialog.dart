import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
import '../extensions/navigation_ext.dart';
import '../theme/custom_text_styles.dart';
import 'assets_manager.dart';

void showErrorDialog(String? errorMsg) async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) => ErrorDialog(errorMsg),
  );
}

class ErrorDialog extends StatelessWidget {
  final String? errorMsg;
  const ErrorDialog(this.errorMsg, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        height: 0.25.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120.h,
              width: 120.w,
              child: Lottie.asset(
                AssetsManager.errorAnimation,
                repeat: false,
                fit: BoxFit.fitWidth,
              ),
            ),
            Gap(16.h),
            TextHelpers.mediumText(
              text: errorMsg ?? locale.unknown_error_occurred,
              fontSize: 12,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          child: TextHelpers.mediumText(
            text: locale.got_it,
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
