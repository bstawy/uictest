import '../utils/app_constants.dart';
import 'caching_prefs_factory.dart';

class TokensManager {
  static Future<String?> getToken() async {
    String? accessToken =
        await CachingPrefsFactory.secureRead(AppConstants.token);

    return accessToken;
  }

  static Future<String?> getRequestId() async {
    String? requestId =
        await CachingPrefsFactory.secureRead(AppConstants.requestId);

    return requestId;
  }

  static Future<void> setToken(String token) async {
    await CachingPrefsFactory.secureWrite(
      key: AppConstants.token,
      value: token,
    );
  }

  static Future<void> setRequestId(String requestId) async {
    await CachingPrefsFactory.secureWrite(
      key: AppConstants.requestId,
      value: requestId,
    );
  }

  static Future<void> deleteToken() async {
    await CachingPrefsFactory.secureDelete(AppConstants.token);
  }

  static Future<void> deleteRequestId() async {
    await CachingPrefsFactory.secureDelete(AppConstants.requestId);
  }

  static Future<void> deleteAll() async {
    await CachingPrefsFactory.secureDelete(AppConstants.token);
    await CachingPrefsFactory.secureDelete(AppConstants.requestId);
  }
}
