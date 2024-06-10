class LoginResponseModel {
  LoginResponseModel({
    this.status,
    this.message,
    this.token,
  });

  final int? status;
  final String? message;
  final String? token;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json['status'],
        message: json['message'],
        token: json['data']['token'],
      );
}
