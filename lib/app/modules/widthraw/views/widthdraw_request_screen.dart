import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WidthdrawRequestScreen extends StatefulWidget {
  const WidthdrawRequestScreen({super.key});

  @override
  State<WidthdrawRequestScreen> createState() => _WidthdrawRequestScreenState();
}

class _WidthdrawRequestScreenState extends State<WidthdrawRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox24,
            CustomAppBar(name: 'Widthdraw Request', isBack: true),
            heightBox12,
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount',
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff626262))),
                  heightBox8,
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Enter account number';

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'amount',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  heightBox8,
                  Text('Regioun',
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff626262))),
                  heightBox8,
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Enter region';

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'region',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  heightBox8,
                ],
              ),
            ),
            heightBox100,
            CustomElevatedButton(onPressed: () {}, text: 'Submit'),
          ],
        ),
      ),
    );
  }
}
