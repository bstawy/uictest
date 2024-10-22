import 'package:flutter/material.dart';

import '../../../../../../core/extensions/theme_ext.dart';
import '../../../../../../core/theme/custom_text_styles.dart';
import '../../../../../../generated/l10n.dart';

class LoginRememberAndForgetPassword extends StatefulWidget {
  const LoginRememberAndForgetPassword({super.key});

  @override
  State<LoginRememberAndForgetPassword> createState() =>
      _LoginRememberAndForgetPasswordState();
}

class _LoginRememberAndForgetPasswordState
    extends State<LoginRememberAndForgetPassword> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final kColors = context.colors;
    final locale = S.of(context);

    return Row(
      children: [
        Checkbox(
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value!;
            });
          },
          //side: BorderSide(color: kColors.primaryFixed),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        TextHelpers.regularText(
          text: locale.remember_me,
          fontSize: 12,
          color: kColors.primaryFixed,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            // TODO: Navigate to forgot password screen
          },
          child: TextHelpers.regularText(
            text: locale.forgot_password,
            fontSize: 12,
            color: kColors.primaryFixed,
          ),
        ),
      ],
    );
  }
}
