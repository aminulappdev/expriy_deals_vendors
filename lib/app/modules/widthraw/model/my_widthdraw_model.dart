class MyWidthdrawModel {
    MyWidthdrawModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final Data? data;

    factory MyWidthdrawModel.fromJson(Map<String, dynamic> json){ 
        return MyWidthdrawModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
        required this.data,
        required this.meta,
    });

    final List<MyWidthdrawItemModel> data;
    final Meta? meta;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            data: json["data"] == null ? [] : List<MyWidthdrawItemModel>.from(json["data"]!.map((x) => MyWidthdrawItemModel.fromJson(x))),
            meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        );
    }

}

class MyWidthdrawItemModel {
    MyWidthdrawItemModel({
        required this.id,
        required this.vendor,
        required this.amount,
        required this.status,
        required this.isDeleted,
        required this.bankDetails,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? id;
    final Vendor? vendor;
    final int? amount;
    final String? status;
    final bool? isDeleted;
    final String? bankDetails;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory MyWidthdrawItemModel.fromJson(Map<String, dynamic> json){ 
        return MyWidthdrawItemModel(
            id: json["_id"],
            vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
            amount: json["amount"],
            status: json["status"],
            isDeleted: json["isDeleted"],
            bankDetails: json["bankDetails"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
        );
    }

}

class Vendor {
    Vendor({
        required this.id,
        required this.name,
        required this.email,
        required this.phoneNumber,
        required this.profile,
    });

    final String? id;
    final String? name;
    final String? email;
    final String? phoneNumber;
    final String? profile;

    factory Vendor.fromJson(Map<String, dynamic> json){ 
        return Vendor(
            id: json["_id"],
            name: json["name"],
            email: json["email"],
            phoneNumber: json["phoneNumber"],
            profile: json["profile"],
        );
    }

}

class Meta {
    Meta({
        required this.page,
        required this.limit,
        required this.total,
        required this.totalPage,
    });

    final int? page;
    final int? limit;
    final int? total;
    final int? totalPage;

    factory Meta.fromJson(Map<String, dynamic> json){ 
        return Meta(
            page: json["page"],
            limit: json["limit"],
            total: json["total"],
            totalPage: json["totalPage"],
        );
    }

}
