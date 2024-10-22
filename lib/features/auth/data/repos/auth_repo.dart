import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/networking/api_result.dart';
import '../data_sources/remote_auth_data_source.dart';
import '../models/requests/login_request_model.dart';
import '../models/requests/sign_up_request_model.dart';
import '../models/requests/socail_request_model.dart';

@injectable
class AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepo(this.remoteDataSource);

  Future<ApiResult<void>> login(LoginRequestModel loginUserData) async {
    return await remoteDataSource.login(loginUserData);
  }

  Future<ApiResult<void>> signUp(SignUpRequestModel signUpUserData) async {
    return await remoteDataSource.signUp(signUpUserData);
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final SignInWithApple _signInWithApple = SignInWithApple();

  Future<GoogleSignInAccount?> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      return googleUser;
    } catch (e) {
      throw Exception('Google sign-in failed');
    }
  }

  Future<AuthorizationCredentialAppleID?> appleSignIn() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName
        ],
      );
      return appleCredential;
    } catch (e) {
      throw Exception('Apple sign-in failed');
    }
  }

  Future<ApiResult<void>> SocailSign(
      SocialLoginRequestModel socialLoginRequest) async {
    return await remoteDataSource.SocialSignIn(socialLoginRequest);
  }
}
