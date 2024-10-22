import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/shared_widgets/custom_input_field.dart';
import '../../../../../../core/shared_widgets/gradient_elevated_button.dart';
import '../../../../../../core/utils/error_dialog.dart';
import '../../../../../../core/utils/loading_dialog.dart';
import '../../../../../../core/utils/success_dialog.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../../../generated/l10n.dart';
import '../../../widgets/phone_input_field.dart';
import '../../cubit/login_cubit.dart';
import '../biometrics_login_screen_finger.dart';
import 'login_remember_and_forget_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  String _phoneCountryCode = '966';

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  void _login() {
    // if (_formKey.currentState!.validate()) {
    // context.read<AuthCubit>().login(
    //       countryCode: _phoneCountryCode,
    //       phone: _phoneController.text,
    //       password: _passwordController.text,
    //     );
    // }
    // context.read<LoginCubit>().login(
    //       countryCode: '973',
    //       phone: '39112233',
    //       password: 'ABC@123456',
    //     );
    context.pushAnimated(const BiometricsLoginScreenFinger());
  }

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return BlocListener<LoginCubit, LoginState>(
      bloc: context.read<LoginCubit>(),
      listenWhen: (previous, current) {
        if (previous is LoginLoading && current is! LoginLoading) {
          Navigator.of(context).pop();
        }
        return true;
      },
      listener: (context, state) {
        if (state is LoginLoading) {
          showLoadingDialog();
        } else if (state is LoginSuccess) {
          showSuccessDialog();
        } else if (state is LoginError) {
          showErrorDialog(state.error.message);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            PhoneInputField(
              controller: _phoneController,
              onSelectCode: (pickedPhone) {
                _phoneCountryCode = pickedPhone;
              },
            ),
            Gap(16.h),
            CustomInputField(
              controller: _passwordController,
              hint: locale.password,
              isPassword: true,
              validator: Validators.validatePassword,
            ),
            Gap(8.h),
            const LoginRememberAndForgetPassword(),
            Gap(40.h),
            GradientElevatedButton(
              onPressed: () => _login(),
              title: locale.login,
            ),
          ],
        ),
      ),
    );
  }
}
