
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// class BulletPointsWidget extends StatelessWidget {
//   const BulletPointsWidget({super.key});
 
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.all(16.0.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _buildBulletPoint('A quiet place for your body and mind.'),
//           _buildBulletPoint('A support system when you need it.'),
//           _buildBulletPoint('A community that listens and protects.'),
//         ],
//       ),
//     );
//   }

//   Widget _buildBulletPoint(String text) {
//     return Padding(
//       padding:  EdgeInsets.only(bottom: 8.0.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.circle, size: 8.sp, color: Colors.black), // Bullet icon
//           SizedBox(width: 8.w),
//           Text(
//             text,
//             style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w400),
//           ),
//         ],
//       ),
//     );
//   }
// }