class SignUpRequestModel {
  String? name;
  String? idNumber;
  String? nationality;
  String? gender;
  String? emailAddress;
  String? countryCode;
  String? mobileNumber;
  String? password;
  String? confirmPassword;
  String? userId;
  String? sendOtpFlag;

  SignUpRequestModel({
    this.name,
    this.idNumber,
    this.nationality,
    this.gender,
    this.emailAddress,
    this.countryCode,
    this.mobileNumber,
    this.password,
    this.confirmPassword,
    this.userId,
    this.sendOtpFlag,
  });

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["idNumber"] is String) {
      idNumber = json["idNumber"];
    }
    if (json["nationality"] is String) {
      nationality = json["nationality"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["emailAddress"] is String) {
      emailAddress = json["emailAddress"];
    }
    if (json["countryCode"] is String) {
      countryCode = json["countryCode"];
    }
    if (json["mobileNumber"] is String) {
      mobileNumber = json["mobileNumber"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["confirmPassword"] is String) {
      confirmPassword = json["confirmPassword"];
    }
    if (json["userId"] is String) {
      userId = json["userId"];
    }
    if (json["sendOtpFlag"] is String) {
      sendOtpFlag = json["sendOtpFlag"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["idNumber"] = idNumber;
    data["nationality"] = nationality;
    data["gender"] = gender;
    data["emailAddress"] = emailAddress;
    data["countryCode"] = countryCode;
    data["mobileNumber"] = mobileNumber;
    data["password"] = password;
    data["confirmPassword"] = confirmPassword;
    data["userId"] = userId;
    data["sendOtpFlag"] = sendOtpFlag;
    return data;
  }
}
