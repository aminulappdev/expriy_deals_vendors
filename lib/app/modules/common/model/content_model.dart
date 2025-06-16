class ContentsModel {
    ContentsModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final ContentData? data;

    factory ContentsModel.fromJson(Map<String, dynamic> json){ 
        return ContentsModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : ContentData.fromJson(json["data"]),
        );
    }

}

class ContentData {
    ContentData({
        required this.id,
        required this.aboutUs,
        required this.termsAndConditions,
        required this.privacyPolicy,
        required this.supports,
        required this.faq,
        required this.isDeleted,
        required this.banner,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String? id;
    final String? aboutUs;
    final String? termsAndConditions;
    final String? privacyPolicy;
    final String? supports;
    final String? faq;
    final bool? isDeleted;
    final List<dynamic> banner;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory ContentData.fromJson(Map<String, dynamic> json){ 
        return ContentData(
            id: json["_id"],
            aboutUs: json["aboutUs"],
            termsAndConditions: json["termsAndConditions"],
            privacyPolicy: json["privacyPolicy"],
            supports: json["supports"],
            faq: json["faq"],
            isDeleted: json["isDeleted"],
            banner: json["banner"] == null ? [] : List<dynamic>.from(json["banner"]!.map((x) => x)),
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
        );
    }

}
