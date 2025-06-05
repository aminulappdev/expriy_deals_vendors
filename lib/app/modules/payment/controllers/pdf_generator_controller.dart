// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart' as pw;



// class PdfController extends GetxController {
//   // final PaymentController paymentController = Get.find();
  

//   Future<void> generateAndSavePDF(String date, String transactionId, String price, String name) async {
//     try {
//       final pdf = pw.Document();

//       pdf.addPage(
//         pw.Page(
//           build: (pw.Context context) => pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text(
//                 'Payment Receipt',
//                 style: pw.TextStyle(
//                   fontSize: 24,
//                   fontWeight: pw.FontWeight.bold,
//                 ),
//               ),
//               pw.SizedBox(height: 20),
//               pw.Text(
//                 'Payment Total: ₦$price',
//                 style: pw.TextStyle(
//                   fontSize: 18,
//                   fontWeight: pw.FontWeight.bold,
//                 ),
//               ),
//               pw.SizedBox(height: 20),
//               pw.Divider(),
//               pw.SizedBox(height: 10),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text('Date:'),
//                   pw.Text(date),
//                 ],
//               ),
//               pw.SizedBox(height: 10),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text('Transaction ID:'),
//                   pw.Text(transactionId),
//                 ],
//               ),
//               pw.SizedBox(height: 10),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text('Account:'),
//                   pw.Text(name),
//                 ],
//               ),
//               pw.SizedBox(height: 10),
//               pw.Divider(),
//               pw.SizedBox(height: 10),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text('Total Payment:'),
//                   pw.Text(price),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );

//       // Get the directory for saving the file
//       final directory = await getApplicationDocumentsDirectory();
//       final file = File('${directory.path}/payment_receipt.pdf');

//       // Save the PDF file
//       await file.writeAsBytes(await pdf.save());

//       // Show success message
//       Get.snackbar(
//         'Success',
//         'PDF receipt has been generated and saved',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     print('My file is $file');
//       // Optional: Open the PDF file
//       await OpenFile.open(file.path);
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to generate PDF: $e',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }
// }
