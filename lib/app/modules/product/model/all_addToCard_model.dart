
import 'package:expriy_deals_vendors/app/modules/product/model/product_details_model.dart';

class AllAddToCartModel {
    AllAddToCartModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final Data? data;

    factory AllAddToCartModel.fromJson(Map<String, dynamic> json){ 
        return AllAddToCartModel(
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

    final List<AllAddToCardItemModel> data;
    final Meta? meta;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            data: json["data"] == null ? [] : List<AllAddToCardItemModel>.from(json["data"]!.map((x) => AllAddToCardItemModel.fromJson(x))),
            meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        );
    }

}

class AllAddToCardItemModel {
    AllAddToCardItemModel({
        required this.id,
        required this.user,
        required this.product,
        required this.quantity,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? id;
    final User? user;
    final ProductDetailsData? product;
    final int? quantity;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory AllAddToCardItemModel.fromJson(Map<String, dynamic> json){ 
        return AllAddToCardItemModel(
            id: json["_id"],
            user: json["user"] == null ? null : User.fromJson(json["user"]),
            product: json["product"] == null ? null : ProductDetailsData.fromJson(json["product"]),
            quantity: json["quantity"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
        );
    }

}



class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.phoneNumber,
        required this.profile,
        required this.shop,
    });

    final String? id;
    final String? name;
    final String? email;
    final String? phoneNumber;
    final String? profile;
    final Shop? shop;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            id: json["_id"],
            name: json["name"],
            email: json["email"],
            phoneNumber: json["phoneNumber"],
            profile: json["profile"],
            shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
        );
    }

}

class Shop {
    Shop({
        required this.location,
        required this.description,
        required this.address,
        required this.openingHours,
        required this.openingDays,
        required this.logo,
        required this.banner,
        required this.id,
        required this.name,
        required this.bannerColor,
        required this.author,
        required this.isDeleted,
    });

    final Location? location;
    final dynamic description;
    final dynamic address;
    final dynamic openingHours;
    final dynamic openingDays;
    final dynamic logo;
    final dynamic banner;
    final String? id;
    final String? name;
    final String? bannerColor;
    final String? author;
    final bool? isDeleted;

    factory Shop.fromJson(Map<String, dynamic> json){ 
        return Shop(
            location: json["location"] == null ? null : Location.fromJson(json["location"]),
            description: json["description"],
            address: json["address"],
            openingHours: json["openingHours"],
            openingDays: json["openingDays"],
            logo: json["logo"],
            banner: json["banner"],
            id: json["_id"],
            name: json["name"],
            bannerColor: json["bannerColor"],
            author: json["author"],
            isDeleted: json["isDeleted"],
        );
    }

}

class Location {
    Location({
        required this.type,
        required this.coordinates,
    });

    final String? type;
    final List<double> coordinates;

    factory Location.fromJson(Map<String, dynamic> json){ 
        return Location(
            type: json["type"],
            coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x)),
        );
    }

}

class Category {
    Category({
        required this.id,
        required this.name,
        required this.banner,
    });

    final String? id;
    final String? name;
    final String? banner;

    factory Category.fromJson(Map<String, dynamic> json){ 
        return Category(
            id: json["_id"],
            name: json["name"],
            banner: json["banner"],
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
