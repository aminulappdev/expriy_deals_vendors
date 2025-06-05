class SubscriptionResponseModel {
    SubscriptionResponseModel({
        required this.success,
        required this.statusCode, 
        required this.message,
        required this.data,
    });

    final bool? success;
    final int? statusCode;
    final String? message;
    final SubscriptionResponseItemModel? data;

    factory SubscriptionResponseModel.fromJson(Map<String, dynamic> json){ 
        return SubscriptionResponseModel(
            success: json["success"],
            statusCode: json["statusCode"],
            message: json["message"],
            data: json["data"] == null ? null : SubscriptionResponseItemModel.fromJson(json["data"]),
        );
    }

}

class SubscriptionResponseItemModel {
    SubscriptionResponseItemModel({
        required this.user,
        required this.package,
        required this.transactionId,
        required this.amount,
        required this.paymentStatus,
        required this.status,
        required this.expiredAt,
        required this.isExpired,
        required this.isDeleted,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String? user;
    final String? package;
    final dynamic transactionId;
    final int? amount;
    final String? paymentStatus;
    final String? status;
    final DateTime? expiredAt;
    final bool? isExpired;
    final bool? isDeleted;
    final String? id;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory SubscriptionResponseItemModel.fromJson(Map<String, dynamic> json){ 
        return SubscriptionResponseItemModel(
            user: json["user"],
            package: json["package"],
            transactionId: json["transactionId"],
            amount: json["amount"],
            paymentStatus: json["paymentStatus"],
            status: json["status"],
            expiredAt: DateTime.tryParse(json["expiredAt"] ?? ""),
            isExpired: json["isExpired"],
            isDeleted: json["isDeleted"],
            id: json["_id"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
        );
    }

}
