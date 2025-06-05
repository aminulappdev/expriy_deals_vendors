
// import 'package:expriy_deals_vendors/app/modules/payment/views/payment_details_screen.dart';
// import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PaymentSuccessScreen extends StatefulWidget {
//   static const String routeName = '/payment-success-screen';
//   const PaymentSuccessScreen({super.key});

//   @override
//   State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
// }

// class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
//   @override
//   void initState() {
//     _movetoNewScreen();
//     super.initState();
//   }

//   Future<void> _movetoNewScreen() async {
//     await Future.delayed(const Duration(seconds: 3));

//     Navigator.pushReplacementNamed(
//       context,
//       PaymentDetailsScreen.routeName,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( 
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               height: 90.h,
//               width: 90.h,
//               decoration: BoxDecoration(
//                   border: Border.all(
//                       color: Color(0xffD9A48E).withOpacity(0.7), width: 3),
//                   color: Color(0xffD9A48E),
//                   shape: BoxShape.circle),
//               child: Center(
//                 child: Icon(
//                   Icons.check,
//                   color: Colors.white,
//                   size: 40,
//                 ),
//               ),
//             ),
//           ),
//           heightBox8,
//           Text('Payment successful')
//         ],
//       ),
//     );
//   }
// }
