import 'package:equatable/equatable.dart';

class BiometricState extends Equatable {
  final bool isBiometricEnabled; // true if biometricFaceID is enabled
  final bool isFingerprintEnabled; // true if fingerprint is enabled
  final bool isInitialized; // true if the app has been initialized
  final bool
  isFirstLogin; // true if this is the first time the app is being used
  final bool
  shouldAuthenticate; // true if the user should be prompted to authenticate

  const BiometricState({
    required this.isBiometricEnabled,
    required this.isFingerprintEnabled,
    required this.isInitialized,
    required this.isFirstLogin,
    required this.shouldAuthenticate,
  });

  BiometricState copyWith({
    bool? isBiometricEnabled,
    bool? isFingerprintEnabled,
    bool? isInitialized,
    bool? isFirstLogin,
    bool? shouldAuthenticate,
  }) {
    return BiometricState(
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      isFingerprintEnabled: isFingerprintEnabled ?? this.isFingerprintEnabled,
      isInitialized: isInitialized ?? this.isInitialized,
      isFirstLogin: isFirstLogin ?? this.isFirstLogin,
      shouldAuthenticate: shouldAuthenticate ?? this.shouldAuthenticate,
    );
  }

  @override
  List<Object> get props => [
    isBiometricEnabled,
    isFingerprintEnabled,
    isInitialized,
    isFirstLogin,
    shouldAuthenticate
  ];
}
