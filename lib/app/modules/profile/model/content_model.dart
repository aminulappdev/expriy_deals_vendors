class ContensModel {
    ContensModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final String? data;

    factory ContensModel.fromJson(Map<String, dynamic> json){ 
        return ContensModel(
            success: json["success"],
            message: json["message"],
            data: json["data"],
        );
    }

}
