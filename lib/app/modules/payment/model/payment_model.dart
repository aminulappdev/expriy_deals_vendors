class PaymentModel {
    PaymentModel({
        required this.success,
        required this.statusCode,
        required this.message,
        required this.data,
    });

    final bool? success;
    final int? statusCode;
    final String? message;
    final String? data;

    factory PaymentModel.fromJson(Map<String, dynamic> json){ 
        return PaymentModel(
            success: json["success"],
            statusCode: json["statusCode"],
            message: json["message"],
            data: json["data"],
        );
    }

}
