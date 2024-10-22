class LoginRequestModel {
  String? countryCode;
  String? mobileNumber;
  String? password;

  LoginRequestModel({
    this.countryCode,
    this.mobileNumber,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'loginCountryCode': countryCode,
      'loginMobileNo': mobileNumber,
      'loginPassword': password,
    };
  }
}
