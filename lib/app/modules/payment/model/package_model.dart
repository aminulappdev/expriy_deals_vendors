class PackageModel {
  bool? success;
  int? statusCode;
  String? message;
  Meta? meta;
  List<PackageItemModel>? data;

  PackageModel(
      {this.success, this.statusCode, this.message, this.meta, this.data});

  PackageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <PackageItemModel>[];
      json['data'].forEach((v) {
        data!.add(PackageItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    data['totalPage'] = totalPage;
    return data;
  }
}

class PackageItemModel {
  String? sId;
  String? title;
  String? subtitle;
  String? billingCycle;
  List<String>? description;
  int? price;
  int? popularity;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  PackageItemModel(
      {this.sId,
      this.title,
      this.subtitle,
      this.billingCycle,
      this.description,
      this.price,
      this.popularity,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  PackageItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    billingCycle = json['billingCycle'];
    description = json['description'].cast<String>();
    price = json['price'];
    popularity = json['popularity'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['billingCycle'] = billingCycle;
    data['description'] = description;
    data['price'] = price;
    data['popularity'] = popularity;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
