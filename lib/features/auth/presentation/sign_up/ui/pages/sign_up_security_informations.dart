import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/shared_widgets/custom_input_field.dart';
import '../../../../../../core/theme/custom_text_styles.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/sign_up_cubit.dart';

class SignUpSecurityInformations extends StatefulWidget {
  const SignUpSecurityInformations({super.key});

  @override
  State<SignUpSecurityInformations> createState() =>
      _SignUpSecurityInformationsState();
}

class _SignUpSecurityInformationsState
    extends State<SignUpSecurityInformations> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _formKey = context.read<SignUpCubit>().signUpSecurityInfromationformKey;
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Gap(50.h),
          TextHelpers.mediumText(
            text: locale.security_informations,
            fontSize: 24,
            textAlign: TextAlign.center,
          ),
          Gap(40.h),
          CustomInputField(
            controller: _passwordController,
            hint: locale.password,
            isPassword: true,
            validator: Validators.validatePassword,
            onChanged: (value) {
              context.read<SignUpCubit>().signUpRequestModel.password = value;
            },
          ),
          Gap(16.h),
          CustomInputField(
            controller: _confirmPasswordController,
            hint: locale.confirm_password,
            isPassword: true,
            validator: (value) {
              return Validators.validatePasswordConfirmation(
                password: _passwordController.text,
                confirmPassword: value,
              );
            },
            onChanged: (value) {
              context.read<SignUpCubit>().signUpRequestModel.confirmPassword =
                  value;
            },
          ),
        ],
      ),
    );
  }
}
