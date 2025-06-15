class MyShopModel {
    MyShopModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final MyShopData? data;

    factory MyShopModel.fromJson(Map<String, dynamic> json){ 
        return MyShopModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : MyShopData.fromJson(json["data"]),
        );
    }

}

class MyShopData {
    MyShopData({
        required this.location,
        required this.id,
        required this.name,
        required this.description,
        required this.address,
        required this.openingHours,
        required this.openingDays,
        required this.logo,
        required this.banner,
        required this.document,
        required this.author,
        required this.isDeleted,
        required this.bannerColor,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final Location? location;
    final String? id;
    final String? name;
    final dynamic description;
    final dynamic address;
    final dynamic openingHours;
    final dynamic openingDays;
    final dynamic logo;
    final dynamic banner;
    final String? document;
    final String? author;
    final bool? isDeleted;
    final String? bannerColor;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory MyShopData.fromJson(Map<String, dynamic> json){ 
        return MyShopData(
            location: json["location"] == null ? null : Location.fromJson(json["location"]),
            id: json["_id"],
            name: json["name"],
            description: json["description"],
            address: json["address"],
            openingHours: json["openingHours"],
            openingDays: json["openingDays"],
            logo: json["logo"],
            banner: json["banner"],
            document: json["document"],
            author: json["author"],
            isDeleted: json["isDeleted"],
            bannerColor: json["bannerColor"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
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
