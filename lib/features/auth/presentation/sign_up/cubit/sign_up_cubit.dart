import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/errors/api_error_handler.dart';
import '../../../../../core/networking/errors/api_error_model.dart';
import '../../../data/models/requests/sign_up_request_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo _authRepo;
  SignUpCubit(this._authRepo) : super(SignUpInitial());

  final PageController signUpPageController = PageController(initialPage: 0);
  SignUpRequestModel signUpRequestModel = SignUpRequestModel(
    countryCode: '966',
  );
  final GlobalKey<FormState> signUpContactDetailsformKey =
      GlobalKey<FormState>();
  final GlobalKey<FormState> signUpOtpVerificationformKey =
      GlobalKey<FormState>();
  final GlobalKey<FormState> signUpPersonalDetailsformKey =
      GlobalKey<FormState>();
  final GlobalKey<FormState> signUpSecurityInfromationformKey =
      GlobalKey<FormState>();

  Future<void> signUp() async {
    log("${signUpRequestModel.toJson()}", name: 'Sign Up Request Model');
    emit(SignUpLoading());

    final result = await _authRepo.signUp(signUpRequestModel);

    switch (result) {
      case Success():
        emit(SignUpSuccess());
      case Failure():
        emit(
          SignUpError(
            ApiErrorHandler.handle(result.exception),
          ),
        );
    }
  }

  void validateSignUpContactDetails() {
    log('${signUpRequestModel.idNumber}', name: 'ID Number');
    log('${signUpRequestModel.countryCode}', name: 'Country Code');
    log('${signUpRequestModel.mobileNumber}', name: 'Mobile Number');
    if (signUpContactDetailsformKey.currentState!.validate()) {
      _nextPage();
    }
  }

  void validateSignUpOtpVerification() {
    // if (signUpOtpVerificationformKey.currentState!.validate()) {
    //   _nextPage();
    // }
    _nextPage();
  }

  void validateSignUpPersonalDetails() {
    log('${signUpRequestModel.name}', name: 'Name');
    log('${signUpRequestModel.emailAddress}', name: 'Email');
    log('${signUpRequestModel.nationality}', name: 'Nationality');
    log('${signUpRequestModel.gender}', name: 'Gender');
    if (signUpPersonalDetailsformKey.currentState!.validate()) {
      _nextPage();
    }
  }

  void validateSignUpSecurityInformations() {
    log('${signUpRequestModel.password}', name: 'Password');
    log('${signUpRequestModel.confirmPassword}', name: 'Confirm Password');
    if (signUpSecurityInfromationformKey.currentState!.validate()) {
      signUp();
    }
  }

  void _nextPage() {
    signUpPageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
