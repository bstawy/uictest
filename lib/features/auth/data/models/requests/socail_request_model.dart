class SocialLoginRequestModel {
  final String provider;
  final String? email;
  final String? id;

  SocialLoginRequestModel({
    required this.provider,
    required this.email,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'provider': provider,
      'email': email,
      'id': id,
    };
  }
}
