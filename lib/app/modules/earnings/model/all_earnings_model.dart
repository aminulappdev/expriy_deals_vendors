class AllEarningsModel {
    AllEarningsModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final Data? data;

    factory AllEarningsModel.fromJson(Map<String, dynamic> json){ 
        return AllEarningsModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
        required this.totalEarnings,
        required this.todayEarnings,
        required this.allData,
    });

    final dynamic totalEarnings;
    final dynamic todayEarnings;
    final List<AllEarningsItemModel> allData;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            totalEarnings: json["totalEarnings"],
            todayEarnings: json["todayEarnings"],
            allData: json["allData"] == null ? [] : List<AllEarningsItemModel>.from(json["allData"]!.map((x) => AllEarningsItemModel.fromJson(x))),
        );
    }

}

class AllEarningsItemModel {
    AllEarningsItemModel({
        required this.id,
        required this.status,
        required this.trnId,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
        required this.author,
    });

    final String? id;
    final String? status;
    final String? trnId;
    final dynamic price;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final User? user;
    final Author? author;

    factory AllEarningsItemModel.fromJson(Map<String, dynamic> json){ 
        return AllEarningsItemModel(
            id: json["_id"],
            status: json["status"],
            trnId: json["trnId"],
            price: json["price"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            user: json["user"] == null ? null : User.fromJson(json["user"]),
            author: json["author"] == null ? null : Author.fromJson(json["author"]),
        );
    }

}

class Author {
    Author({
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
        required this.verification,
        required this.balance,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.loginWth,
        required this.shop,
    });

    final String? id;
    final String? status;
    final String? name;
    final String? email;
    final String? phoneNumber;
    final String? password;
    final String? gender;
    final DateTime? dateOfBirth;
    final bool? isGoogleLogin;
    final String? profile;
    final String? document;
    final String? role;
    final String? address;
    final bool? isDeleted;
    final AuthorVerification? verification;
    final int? balance;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? loginWth;
    final String? shop;

    factory Author.fromJson(Map<String, dynamic> json){ 
        return Author(
            id: json["_id"],
            status: json["status"],
            name: json["name"],
            email: json["email"],
            phoneNumber: json["phoneNumber"],
            password: json["password"],
            gender: json["gender"],
            dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
            isGoogleLogin: json["isGoogleLogin"],
            profile: json["profile"],
            document: json["document"],
            role: json["role"],
            address: json["address"],
            isDeleted: json["isDeleted"],
            verification: json["verification"] == null ? null : AuthorVerification.fromJson(json["verification"]),
            balance: json["balance"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
            loginWth: json["loginWth"],
            shop: json["shop"],
        );
    }

}

class AuthorVerification {
    AuthorVerification({
        required this.otp,
        required this.expiresAt,
        required this.status,
    });

    final dynamic otp;
    final DateTime? expiresAt;
    final bool? status;

    factory AuthorVerification.fromJson(Map<String, dynamic> json){ 
        return AuthorVerification(
            otp: json["otp"],
            expiresAt: DateTime.tryParse(json["expiresAt"] ?? ""),
            status: json["status"],
        );
    }

}

class User {
    User({
        required this.id,
        required this.status,
        required this.name,
        required this.shop,
        required this.email,
        required this.phoneNumber,
        required this.password,
        required this.gender,
        required this.dateOfBirth,
        required this.loginWth,
        required this.profile,
        required this.document,
        required this.role,
        required this.address,
        required this.city,
        required this.state,
        required this.country,
        required this.zipCode,
        required this.isDeleted,
        required this.verification,
        required this.balance,
        required this.expireAt,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.customer,
    });

    final String? id;
    final String? status;
    final String? name;
    final dynamic shop;
    final String? email;
    final dynamic phoneNumber;
    final String? password;
    final dynamic gender;
    final dynamic dateOfBirth;
    final String? loginWth;
    final String? profile;
    final dynamic document;
    final String? role;
    final dynamic address;
    final dynamic city;
    final dynamic state;
    final dynamic country;
    final dynamic zipCode;
    final bool? isDeleted;
    final UserVerification? verification;
    final int? balance;
    final dynamic expireAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? customer;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            id: json["_id"],
            status: json["status"],
            name: json["name"],
            shop: json["shop"],
            email: json["email"],
            phoneNumber: json["phoneNumber"],
            password: json["password"],
            gender: json["gender"],
            dateOfBirth: json["dateOfBirth"],
            loginWth: json["loginWth"],
            profile: json["profile"],
            document: json["document"],
            role: json["role"],
            address: json["address"],
            city: json["city"],
            state: json["state"],
            country: json["country"],
            zipCode: json["zipCode"],
            isDeleted: json["isDeleted"],
            verification: json["verification"] == null ? null : UserVerification.fromJson(json["verification"]),
            balance: json["balance"],
            expireAt: json["expireAt"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
            customer: json["customer"],
        );
    }

}

class UserVerification {
    UserVerification({
        required this.otp,
        required this.expiresAt,
        required this.status,
    });

    final int? otp;
    final DateTime? expiresAt;
    final bool? status;

    factory UserVerification.fromJson(Map<String, dynamic> json){ 
        return UserVerification(
            otp: json["otp"],
            expiresAt: DateTime.tryParse(json["expiresAt"] ?? ""),
            status: json["status"],
        );
    }

}
