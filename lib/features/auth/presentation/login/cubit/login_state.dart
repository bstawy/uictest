part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final ApiErrorModel error;

  LoginError(this.error);
}

// Google Sign-In States
final class GoogleSignInLoading extends LoginState {}

final class GoogleSignInSuccess extends LoginState {}

final class GoogleSignInError extends LoginState {
  final ApiErrorModel error;

  GoogleSignInError(this.error);
}

// Apple Sign-In States
final class AppleSignInLoading extends LoginState {}

final class AppleSignInSuccess extends LoginState {}

final class AppleSignInError extends LoginState {
  final ApiErrorModel error;

  AppleSignInError(this.error);
}
