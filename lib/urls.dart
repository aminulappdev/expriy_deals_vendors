class Urls {
  static const String _baseUrl = 'https://api.expirydeals.online/api/v1/';
  // static const String _baseUrl = 'http://192.168.10.22:7000/api/v1';
  static const String createUserUrl = '$_baseUrl/vendor-request';
  static const String otpVerifyrUrl = '$_baseUrl/otp/verify-otp';
  static const String signInUrl = '$_baseUrl/auth/login';
  static const String forgotPasswordUrl = '$_baseUrl/auth/forgot-password';
  static const String resendOTPUrl = '$_baseUrl/otp/resend-otp';
  static const String resetPasswordUrl = '$_baseUrl/auth/reset-password';
  static const String googleAuthUrl = '$_baseUrl/auth/google-login';
  static const String getProfileUrl = '$_baseUrl/users/my-profile';
  static const String updateProfileUrl = '$_baseUrl/users/update-my-profile';
  static const String updateShopUrl = '$_baseUrl/shop/update-my-shop';
  static const String categoryUrl = '$_baseUrl/categories';
  static const String productUrl = '$_baseUrl/products/my-products';
  static const String ordertUrl = '$_baseUrl/orders';
  static const String addToCartUrl = '$_baseUrl/add-to-card';
  static const String myOrderUrl = '$_baseUrl/orders/my-orders';
  static const String allShopsUrl = '$_baseUrl/shop';
  static const String addProductUrl = '$_baseUrl/products';
  static const String orderDetailstUrl = '$_baseUrl/orders';
  static const String createCardInfotUrl = '$_baseUrl/bank-details';
  static const String bankDetailstUrl =
      '$_baseUrl/bank-details/my-bank-details';
  static const String changePasswordtUrl = '$_baseUrl/auth/change-password';
  static const String withdrawUrl = '$_baseUrl/withdraw-request/my-request';
  static const String withdrawRequestUrl = '$_baseUrl/withdraw-request';
  static const String contentUrl = '$_baseUrl/contents';
  static const String vendorEarningsUrl = '$_baseUrl/payments/vendor-earnings';
  static const String vendorEarningDashboardUrl =
      '$_baseUrl/payments/vendor-dashboard-data';
  static const String stripeRequestUrl = '$_baseUrl/stripe/connect';
  static const String getShopUrl = '$_baseUrl/shop/my-shop';
  static const String notificationUrl = '$_baseUrl/notifications';
  static const String contentByParam = '$_baseUrl/contents';

  static String productDetailsById(
    String id,
  ) {
    return '$_baseUrl/products/$id';
  }

  static String updateProductById(
    String id,
  ) {
    return '$_baseUrl/products/$id';
  }

  static String updateBankDetailsById(
    String id,
  ) {
    return '$_baseUrl/bank-details/$id';
  }

  static String deleteCartById(
    String id,
  ) {
    return '$_baseUrl/add-to-card/$id';
  }

  static String updateOrderStatusById(
    String id,
  ) {
    return '$_baseUrl/orders/$id';
  }
}
