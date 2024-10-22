import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/caching/caching_prefs_factory.dart';
import 'biometric_state.dart';

class BiometricCubit extends Cubit<BiometricState> {
  BiometricCubit()
      : super(const BiometricState(
          isBiometricEnabled: false,
          isFingerprintEnabled: false,
          isInitialized: false,
          isFirstLogin: true,
          shouldAuthenticate: true,
        )) {
    _loadSettings();
  }

  void toggleBiometric(bool value) {
    emit(state.copyWith(isBiometricEnabled: value, shouldAuthenticate: false));
    _saveSettings(state.copyWith(isBiometricEnabled: value));
  }

  void toggleFingerprint(bool value) {
    emit(
        state.copyWith(isFingerprintEnabled: value, shouldAuthenticate: false));
    _saveSettings(state.copyWith(isFingerprintEnabled: value));
  }

  Future<void> _saveSettings(BiometricState state) async {
    CachingPrefsFactory.putBoolean(
        key: 'isBiometricEnabled', value: state.isBiometricEnabled);
    CachingPrefsFactory.putBoolean(
        key: 'isFingerprintEnabled', value: state.isFingerprintEnabled);
    CachingPrefsFactory.putBoolean(
        key: 'isFirstLogin', value: state.isFirstLogin);
  }

  Future<void> _loadSettings() async {
    final isBiometricEnabled =
        CachingPrefsFactory.getBoolean(key: 'isBiometricEnabled') ?? false;
    final isFingerprintEnabled =
        CachingPrefsFactory.getBoolean(key: 'isFingerprintEnabled') ?? false;
    final isFirstLogin =
        CachingPrefsFactory.getBoolean(key: 'isFirstLogin') ?? true;

    emit(BiometricState(
      isBiometricEnabled: isBiometricEnabled,
      isFingerprintEnabled: isFingerprintEnabled,
      isInitialized: true,
      isFirstLogin: isFirstLogin,
      shouldAuthenticate: true,
    ));
  }

  void markFirstLoginComplete() {
    emit(state.copyWith(isFirstLogin: false, shouldAuthenticate: true));
    _saveSettings(state.copyWith(isFirstLogin: false));
  }

  void enableAuthentication() {
    emit(state.copyWith(shouldAuthenticate: true));
  }

  // Function to clear all biometric settings when the user logs out
  Future<void> clearBiometricSettings() async {
    // Clear the biometric settings in local storage
    await CachingPrefsFactory.saveData(key: 'isBiometricEnabled', value: false);
    await CachingPrefsFactory.saveData(
        key: 'isFingerprintEnabled', value: false);
    await CachingPrefsFactory.saveData(key: 'isFirstLogin', value: true);
    // Emit the updated state with defaults
    emit(const BiometricState(
      isBiometricEnabled: false,
      isFingerprintEnabled: false,
      isInitialized: true,
      isFirstLogin: true,
      shouldAuthenticate: true,
    ));
  }
}
