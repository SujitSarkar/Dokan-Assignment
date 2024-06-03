import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String? token;
  final String? userEmail;
  final String? userNicename;
  final String? userDisplayName;

  LoginModel({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
      };
}
