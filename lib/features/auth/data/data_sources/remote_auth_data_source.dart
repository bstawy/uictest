import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/caching/tokens_manager.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/dio/dio_factory.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../../../../core/utils/app_constants.dart';
import '../models/requests/login_request_model.dart';
import '../models/requests/sign_up_request_model.dart';
import '../models/requests/socail_request_model.dart';

@injectable
class AuthRemoteDataSource {
  final Dio _freeDio = DioFactory.getFreeDio();
  final Dio _tokenDio = DioFactory.getTokenDio();

  Future<ApiResult<Response>> _authenticateApp() async {
    return await executeApiCall(() {
      return _freeDio.post(
        ApiEndPoints.auth,
        data: {
          'userName': 'UIC_MOB_API_01',
          'password': '123456',
        },
      );
    });
  }

  Future<ApiResult<void>> login(LoginRequestModel loginUserData) async {
    final response = await _authenticateApp();

    switch (response) {
      case Success():
        TokensManager.setToken(response.data.data['Bearer Token']);
        TokensManager.setRequestId(response.data.data['X-REQUEST-ID']);
        break;
      case Failure():
        return Failure(response.exception);
    }

    return await executeApiCall(() {
      return _tokenDio.post(
        ApiEndPoints.login,
        data: loginUserData.toJson(),
      );
    });
  }

  Future<ApiResult<void>> signUp(SignUpRequestModel signUpUserData) async {
    final response = await _authenticateApp();

    switch (response) {
      case Success():
        TokensManager.setToken(response.data.data['Bearer Token']);
        TokensManager.setRequestId(response.data.data['X-REQUEST-ID']);
        break;
      case Failure():
        return Failure(response.exception);
    }

    return await executeApiCall(() {
      return _tokenDio.post(
        ApiEndPoints.signUp,
        data: signUpUserData.toJson(),
      );
    });
  }

  Future<ApiResult<void>> SocialSignIn(SocialLoginRequestModel socialLoginRequest) async {
    log(socialLoginRequest.toString(), name: 'Social Login Request');

    final response = await _authenticateApp();

    switch (response) {
      case Success():
        TokensManager.setToken(response.data.data['Bearer Token']);
        TokensManager.setRequestId(response.data.data['X-REQUEST-ID']);
        break;
      case Failure():
        return Failure(response.exception);
    }

    return await executeApiCall(() {
      return _tokenDio.post(
        "https://your-api-server.com/social-login",
        data: socialLoginRequest.toJson(),
      );
    });
  }
}
