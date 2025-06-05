// // payment_service.dart

// import 'package:expriy_deals_vendors/app/modules/payment/controllers/payment_controller.dart';
// import 'package:expriy_deals_vendors/app/modules/payment/views/payment_webview_screen.dart';
// import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class PaymentService {
//   final PaymentController paymentController = PaymentController();

//   Future<void> payment(BuildContext context, String modelType, String userId,
//       String referenceId) async {
//     final bool isSuccess =
//         await paymentController.getPayment(modelType, userId, referenceId);

//     Map<String, dynamic> paymentData = {
//       'link': paymentController.paymentData?.data,
//       'reference': referenceId
//     };

//     if (isSuccess) {
//       // Directly use context without mounted check
//       showSnackBarMessage(context, 'Payment request done');
//       Get.to(PaymentWebviewScreen(paymentData: paymentData));
//     } else {
//       // Error handling
//       showSnackBarMessage(context,
//           paymentController.errorMessage ?? 'There was a problem', true);
//     }
//   }
// }
