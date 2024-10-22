import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/navigation_ext.dart';
import '../../../../../../core/utils/error_dialog.dart';
import '../../../../../../core/utils/loading_dialog.dart';
import '../../../../../../core/utils/success_dialog.dart';
import '../../cubit/sign_up_cubit.dart';

class SignUpListener extends StatelessWidget {
  const SignUpListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) {
        if (previous is SignUpLoading && current is! SignUpLoading) {
          context.pop();
        }
        return true;
      },
      listener: (context, state) {
        if (state is SignUpLoading) {
          showLoadingDialog();
        } else if (state is SignUpSuccess) {
          showSuccessDialog();
        } else if (state is SignUpError) {
          showErrorDialog(state.error.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
