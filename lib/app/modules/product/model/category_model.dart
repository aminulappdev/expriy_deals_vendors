class CategoryModel {
    CategoryModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final CategoryItemModel? data;

    factory CategoryModel.fromJson(Map<String, dynamic> json){ 
        return CategoryModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : CategoryItemModel.fromJson(json["data"]),
        );
    }

}

class CategoryItemModel {
    CategoryItemModel({
        required this.data,
        required this.meta,
    });

    final List<CategoryData> data;
    final Meta? meta;

    factory CategoryItemModel.fromJson(Map<String, dynamic> json){ 
        return CategoryItemModel(
            data: json["data"] == null ? [] : List<CategoryData>.from(json["data"]!.map((x) => CategoryData.fromJson(x))),
            meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        );
    }

}

class CategoryData {
    CategoryData({
        required this.id,
        required this.name,
        required this.banner,
        required this.isDeleted,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? id;
    final String? name;
    final String? banner;
    final bool? isDeleted;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory CategoryData.fromJson(Map<String, dynamic> json){ 
        return CategoryData(
            id: json["_id"],
            name: json["name"],
            banner: json["banner"],
            isDeleted: json["isDeleted"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
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
