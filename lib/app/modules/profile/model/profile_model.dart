class ProfileModel {
    ProfileModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final ProfileData? data;

    factory ProfileModel.fromJson(Map<String, dynamic> json){ 
        return ProfileModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
        );
    }

}

class ProfileData {
    ProfileData({
        required this.verification,
        required this.shop,
        required this.zipCode,
        required this.id,
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
        required this.balance,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.passwordChangedAt,
        required this.loginWth,
        required this.city,
        required this.country,
        required this.state,
        required this.expireAt,
    });

    final Verification? verification;
    final dynamic shop;
    final dynamic zipCode;
    final String? id;
    final String? status;
    final String? name;
    final String? email;
    final String? phoneNumber;
    final String? password;
    final dynamic gender;
    final dynamic dateOfBirth;
    final bool? isGoogleLogin;
    final String? profile;
    final dynamic document;
    final String? role;
    final String? address;
    final bool? isDeleted;
    final int? balance;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final DateTime? passwordChangedAt;
    final String? loginWth;
    final String? city;
    final String? country;
    final String? state;
    final DateTime? expireAt;

    factory ProfileData.fromJson(Map<String, dynamic> json){ 
        return ProfileData(
            verification: json["verification"] == null ? null : Verification.fromJson(json["verification"]),
            shop: json["shop"],
            zipCode: json["zipCode"],
            id: json["_id"],
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
            balance: json["balance"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
            passwordChangedAt: DateTime.tryParse(json["passwordChangedAt"] ?? ""),
            loginWth: json["loginWth"],
            city: json["city"],
            country: json["country"],
            state: json["state"],
            expireAt: DateTime.tryParse(json["expireAt"] ?? ""),
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

    factory Verification.fromJson(Map<String, dynamic> json){ 
        return Verification(
            otp: json["otp"],
            status: json["status"],
        );
    }

}
