class EarningDashboardModel {
  EarningDashboardModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final EarningDashboardData? data;

  factory EarningDashboardModel.fromJson(Map<String, dynamic> json) {
    return EarningDashboardModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null
          ? null
          : EarningDashboardData.fromJson(json["data"]),
    );
  }
}

class EarningDashboardData {
  EarningDashboardData({
    required this.totalIncome,
    required this.totalProducts,
    required this.monthlyIncome,
  });

  final double? totalIncome;
  final int? totalProducts;
  final List<MonthlyIncome> monthlyIncome;

  factory EarningDashboardData.fromJson(Map<String, dynamic> json) {
    return EarningDashboardData(
      totalIncome: json["totalIncome"],
      totalProducts: json["totalProducts"],
      monthlyIncome: json["monthlyIncome"] == null
          ? []
          : List<MonthlyIncome>.from(
              json["monthlyIncome"]!.map((x) => MonthlyIncome.fromJson(x))),
    );
  }
}

class MonthlyIncome {
  MonthlyIncome({
    required this.month,
    required this.income,
  });

  final String? month;
  final int? income;

  factory MonthlyIncome.fromJson(Map<String, dynamic> json) {
    return MonthlyIncome(
      month: json["month"],
      income: json["income"],
    );
  }
}
