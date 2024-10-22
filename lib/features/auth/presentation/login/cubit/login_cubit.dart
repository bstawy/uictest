import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/errors/api_error_handler.dart';
import '../../../../../core/networking/errors/api_error_model.dart';
import '../../../data/models/requests/login_request_model.dart';
import '../../../data/models/requests/socail_request_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  LoginCubit(this._authRepo) : super(LoginInitial());

  Future<void> login({
    required String countryCode,
    required String phone,
    required String password,
  }) async {
    emit(LoginLoading());

    final loginUserData = LoginRequestModel(
      countryCode: countryCode,
      mobileNumber: phone,
      password: password,
    );

    final result = await _authRepo.login(loginUserData);

    switch (result) {
      case Success():
        emit(LoginSuccess());
      case Failure():
        emit(
          LoginError(
            ApiErrorHandler.handle(result.exception),
          ),
        );
    }
  }

  Future<void> loginWithGoogle() async {
    emit(GoogleSignInLoading());

    try {
      final googleUser = await _authRepo.googleSignIn();
      if (googleUser != null) {
        final loginRequest = SocialLoginRequestModel(
          provider: 'google',
          email: googleUser.email,
          id: googleUser.id,
        );
        log(loginRequest.toJson().toString(), name: 'google Login Request');
        final result = await _authRepo.SocailSign(loginRequest);

        if (result is Success) {
          emit(GoogleSignInSuccess());
        } else if (result is Failure) {
          emit(GoogleSignInError(ApiErrorHandler.handle(result.exception)));
        }
      } else {
        log('Google sign-in canceled.', name: 'Google Sign-in');
        // emit(GoogleSignInError('Google sign-in canceled.'));
      }
    } catch (error) {
      log(error.toString(), name: 'google Login Error');
    }
  }

  Future<void> loginWithApple() async {
    emit(AppleSignInLoading());

    try {
      final appleUser = await _authRepo.appleSignIn();
      if (appleUser != null) {
        final loginRequest = SocialLoginRequestModel(
          provider: 'apple',
          email: appleUser.email,
          id: appleUser.authorizationCode,
        );
        log(loginRequest.toString(), name: 'apple Login Request');
        final result = await _authRepo.SocailSign(loginRequest);

        if (result is Success) {
          emit(AppleSignInSuccess());
        } else if (result is Failure) {
          emit(AppleSignInError(ApiErrorHandler.handle(result.exception)));
        }
      } else {
        // emit(AppleSignInError('Apple sign-in canceled.'));
      }
    } catch (error) {
      //emit(AppleSignInError(error.toString()));
    }
  }
}
