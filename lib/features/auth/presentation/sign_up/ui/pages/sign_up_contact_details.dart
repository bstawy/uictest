import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/shared_widgets/custom_input_field.dart';
import '../../../../../../core/theme/custom_text_styles.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../../../generated/l10n.dart';
import '../../../widgets/phone_input_field.dart';
import '../../cubit/sign_up_cubit.dart';

class SignUpContactDetails extends StatefulWidget {
  const SignUpContactDetails({super.key});

  @override
  State<SignUpContactDetails> createState() => _SignUpContactDetailsState();
}

class _SignUpContactDetailsState extends State<SignUpContactDetails> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _idNumberController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _formKey = context.read<SignUpCubit>().signUpContactDetailsformKey;

    _idNumberController = TextEditingController(
      text: context.read<SignUpCubit>().signUpRequestModel.idNumber ?? '',
    );
    _phoneController = TextEditingController(
      text: context.read<SignUpCubit>().signUpRequestModel.mobileNumber ?? '',
    );
  }

  @override
  void dispose() {
    super.dispose();
    _idNumberController.dispose();
    _phoneController.dispose();
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
            text: locale.id_and_contact_details,
            fontSize: 24,
            textAlign: TextAlign.center,
          ),
          Gap(40.h),
          CustomInputField(
            controller: _idNumberController,
            hint: locale.id_number,
            validator: (value) => Validators.validateNotEmpty(
              title: locale.id_number,
              value: value,
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              context.read<SignUpCubit>().signUpRequestModel.idNumber = value;
              return;
            },
          ),
          Gap(16.h),
          PhoneInputField(
            controller: _phoneController,
            onSelectCode: (pickedCountryCode) {
              context.read<SignUpCubit>().signUpRequestModel.countryCode =
                  pickedCountryCode;
            },
            onInputChanged: (phone) {
              context.read<SignUpCubit>().signUpRequestModel.mobileNumber =
                  phone;
            },
          ),
        ],
      ),
    );
  }
}
