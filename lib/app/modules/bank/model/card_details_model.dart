class BankDetailsModel {
  BankDetailsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final BankDetailsData? data;

  factory BankDetailsModel.fromJson(Map<String, dynamic> json) {
    return BankDetailsModel(
      success: json["success"],
      message: json["message"],
      data:
          json["data"] == null ? null : BankDetailsData.fromJson(json["data"]),
    );
  }
}

class BankDetailsData {
  BankDetailsData({
    required this.id,
    required this.vendor,
    required this.accountNumber,
    required this.routingNumber,
    required this.bankName,
    required this.bankHolderName,
    required this.bankAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? vendor;
  final String? accountNumber;
  final String? routingNumber;
  final String? bankName;
  final String? bankHolderName;
  final String? bankAddress;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory BankDetailsData.fromJson(Map<String, dynamic> json) {
    return BankDetailsData(
      id: json["_id"],
      vendor: json["vendor"],
      accountNumber: json["accountNumber"],
      routingNumber: json["routingNumber"],
      bankName: json["bankName"],
      bankHolderName: json["bankHolderName"],
      bankAddress: json["bankAddress"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
