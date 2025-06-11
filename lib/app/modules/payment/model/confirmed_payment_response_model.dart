class ConfirmedPaymentResponseModel {
    ConfirmedPaymentResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final ConfirmedPaymentResponseItemModel? data;

    factory ConfirmedPaymentResponseModel.fromJson(Map<String, dynamic> json){ 
        return ConfirmedPaymentResponseModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : ConfirmedPaymentResponseItemModel.fromJson(json["data"]),
        );
    }

}

class ConfirmedPaymentResponseItemModel {
    ConfirmedPaymentResponseItemModel({
        required this.id,
        required this.user,
        required this.author,
        required this.order,
        required this.status,
        required this.deliveryStatus,
        required this.trnId,
        required this.price,
        required this.isDeleted,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.paymentIntentId,
    });

    final String? id;
    final User? user;
    final String? author;
    final String? order;
    final String? status;
    final String? deliveryStatus;
    final String? trnId;
    final double? price;
    final bool? isDeleted;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? paymentIntentId;

    factory ConfirmedPaymentResponseItemModel.fromJson(Map<String, dynamic> json){ 
        return ConfirmedPaymentResponseItemModel(
            id: json["_id"],
            user: json["user"] == null ? null : User.fromJson(json["user"]),
            author: json["author"],
            order: json["order"],
            status: json["status"],
            deliveryStatus: json["deliveryStatus"],
            trnId: json["trnId"],
            price: json["price"],
            isDeleted: json["isDeleted"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
            paymentIntentId: json["paymentIntentId"],
        );
    }

}

class User {
    User({
        required this.id,
        required this.name,
    });

    final String? id;
    final String? name;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            id: json["_id"],
            name: json["name"],
        );
    }

}
