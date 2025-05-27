class CreateUserResponseModel {
  CreateUserResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final CreateUserResponseItemModel? data;

  factory CreateUserResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateUserResponseModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null
          ? null
          : CreateUserResponseItemModel.fromJson(json["data"]),
    );
  }
}

class CreateUserResponseItemModel {
  CreateUserResponseItemModel({
    required this.user,
    required this.otpToken,
  });

  final User? user;
  final OtpToken? otpToken;

  factory CreateUserResponseItemModel.fromJson(Map<String, dynamic> json) {
    return CreateUserResponseItemModel(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      otpToken:
          json["otpToken"] == null ? null : OtpToken.fromJson(json["otpToken"]),
    );
  }
}

class OtpToken {
  OtpToken({
    required this.token,
  });

  final String? token;

  factory OtpToken.fromJson(Map<String, dynamic> json) {
    return OtpToken(
      token: json["token"],
    );
  }
}

class User {
  User({
    required this.status,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.gender,
    required this.dateOfBirth,
    required this.isGoogleLogin,
    required this.profile,
    required this.document,
    required this.role,
    required this.address,
    required this.isDeleted,
    required this.verification,
    required this.balance,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? status;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final dynamic gender;
  final dynamic dateOfBirth;
  final bool? isGoogleLogin;
  final dynamic profile;
  final dynamic document;
  final String? role;
  final String? address;
  final bool? isDeleted;
  final Verification? verification;
  final int? balance;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      status: json["status"],
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      password: json["password"],
      gender: json["gender"],
      dateOfBirth: json["dateOfBirth"],
      isGoogleLogin: json["isGoogleLogin"],
      profile: json["profile"],
      document: json["document"],
      role: json["role"],
      address: json["address"],
      isDeleted: json["isDeleted"],
      verification: json["verification"] == null
          ? null
          : Verification.fromJson(json["verification"]),
      balance: json["balance"],
      id: json["_id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class Verification {
  Verification({
    required this.otp,
    required this.status,
  });

  final int? otp;
  final bool? status;

  factory Verification.fromJson(Map<String, dynamic> json) {
    return Verification(
      otp: json["otp"],
      status: json["status"],
    );
  }
}
