import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordRow extends StatefulWidget {
  const ForgotPasswordRow({
    super.key,
     
    required this.ontap,
  });

  
  final VoidCallback ontap;

  @override
  State<ForgotPasswordRow> createState() => _ForgotPasswordRowState();
}

class _ForgotPasswordRowState extends State<ForgotPasswordRow> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: widget.ontap,
      child: Row(
        children: [
          Text(
            'forgot_password_screen.title'.tr,
            style: TextStyle(
              color: Color(0xffFF503C), 
              fontWeight: FontWeight.w700,
              fontSize: 14.sp, 
            ),
          ),
           Text(
            '?',
            style: TextStyle(
              color: Color(0xffFF503C), 
              fontWeight: FontWeight.w700,
              fontSize: 14.sp, 
            ),
          ),
        ],
      ),
    );
  }
}
