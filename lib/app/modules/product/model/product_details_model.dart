class ProductDetailsModel {
    ProductDetailsModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final ProductDetailsData? data;

    factory ProductDetailsModel.fromJson(Map<String, dynamic> json){ 
        return ProductDetailsModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : ProductDetailsData.fromJson(json["data"]),
        );
    }

}

class ProductDetailsData {
    ProductDetailsData({
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
    final List<ImageModel> images;
    final Author? author;
    final String? name;
    final String? details;
    final Category? category;
    final dynamic price;
    final DateTime? expiredAt;
    final int? discount;
    final bool? isDeleted;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final int? stock;

    factory ProductDetailsData.fromJson(Map<String, dynamic> json){ 
        return ProductDetailsData(
            totalSell: json["totalSell"],
            id: json["_id"],
            images: json["images"] == null ? [] : List<ImageModel>.from(json["images"]!.map((x) => ImageModel.fromJson(x))),
            author: json["author"] == null ? null : Author.fromJson(json["author"]),
            name: json["name"],
            details: json["details"],
            category: json["category"] == null ? null : Category.fromJson(json["category"]),
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

class Author {
    Author({
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

    factory Author.fromJson(Map<String, dynamic> json){ 
        return Author(
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

class ImageModel {
    ImageModel({
        required this.key,
        required this.url,
        required this.id,
    });

    final String? key;
    final String? url;
    final String? id;

    factory ImageModel.fromJson(Map<String, dynamic> json){ 
        return ImageModel(
            key: json["key"],
            url: json["url"],
            id: json["_id"],
        );
    }

}
