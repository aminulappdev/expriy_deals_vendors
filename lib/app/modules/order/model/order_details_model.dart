class OrderDetailsModel {
    OrderDetailsModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final Data? data;

    factory OrderDetailsModel.fromJson(Map<String, dynamic> json){ 
        return OrderDetailsModel(
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

    final List<OrderDetailsItemModel> data;
    final Meta? meta;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            data: json["data"] == null ? [] : List<OrderDetailsItemModel>.from(json["data"]!.map((x) => OrderDetailsItemModel.fromJson(x))),
            meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        );
    }

}

class OrderDetailsItemModel {
    OrderDetailsItemModel({
        required this.billingDetails,
        required this.id,
        required this.user,
        required this.author,
        required this.product,
        required this.totalPrice,
        required this.discount,
        required this.quantity,
        required this.status,
        required this.isPaid,
        required this.isDeleted,
        required this.datumId,
        required this.tnxId,
        required this.createdAt,
        required this.updatedAt,
    });

    final BillingDetails? billingDetails;
    final String? id;
    final Author? user;
    final Author? author;
    final Product? product;
    final double? totalPrice;
    final int? discount;
    final int? quantity;
    final String? status;
    final bool? isPaid;
    final bool? isDeleted;
    final String? datumId;
    final String? tnxId;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory OrderDetailsItemModel.fromJson(Map<String, dynamic> json){ 
        return OrderDetailsItemModel(
            billingDetails: json["billingDetails"] == null ? null : BillingDetails.fromJson(json["billingDetails"]),
            id: json["_id"],
            user: json["user"] == null ? null : Author.fromJson(json["user"]),
            author: json["author"] == null ? null : Author.fromJson(json["author"]),
            product: json["product"] == null ? null : Product.fromJson(json["product"]),
            totalPrice: json["totalPrice"],
            discount: json["discount"],
            quantity: json["quantity"],
            status: json["status"],
            isPaid: json["isPaid"],
            isDeleted: json["isDeleted"],
            datumId: json["id"],
            tnxId: json["tnxId"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
        );
    }

}

class Author {
    Author({
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

    factory Author.fromJson(Map<String, dynamic> json){ 
        return Author(
            id: json["_id"],
            name: json["name"],
            email: json["email"],
            phoneNumber: json["phoneNumber"],
            profile: json["profile"],
        );
    }

}

class BillingDetails {
    BillingDetails({
        required this.address,
        required this.city,
        required this.state,
        required this.zipCode,
        required this.country,
    });

    final String? address;
    final String? city;
    final String? state;
    final String? zipCode;
    final String? country;

    factory BillingDetails.fromJson(Map<String, dynamic> json){ 
        return BillingDetails(
            address: json["address"],
            city: json["city"],
            state: json["state"],
            zipCode: json["zipCode"],
            country: json["country"],
        );
    }

}

class Product {
    Product({
        required this.totalSell,
        required this.id,
        required this.images,
        required this.author,
        required this.name,
        required this.details,
        required this.category,
        required this.price,
        required this.expiredAt,
        required this.discount,
        required this.isDeleted,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.stock,
    });

    final int? totalSell;
    final String? id;
    final List<Image> images;
    final String? author;
    final String? name;
    final String? details;
    final String? category;
    final double? price;
    final DateTime? expiredAt;
    final int? discount;
    final bool? isDeleted;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final int? stock;

    factory Product.fromJson(Map<String, dynamic> json){ 
        return Product(
            totalSell: json["totalSell"],
            id: json["_id"],
            images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
            author: json["author"],
            name: json["name"],
            details: json["details"],
            category: json["category"],
            price: json["price"],
            expiredAt: DateTime.tryParse(json["expiredAt"] ?? ""),
            discount: json["discount"],
            isDeleted: json["isDeleted"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
            stock: json["stock"],
        );
    }

}

class Image {
    Image({
        required this.key,
        required this.url,
        required this.id,
    });

    final String? key;
    final String? url;
    final String? id;

    factory Image.fromJson(Map<String, dynamic> json){ 
        return Image(
            key: json["key"],
            url: json["url"],
            id: json["_id"],
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
