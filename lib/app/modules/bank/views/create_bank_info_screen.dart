import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBankInfoScreen extends StatefulWidget {
  const CreateBankInfoScreen({super.key});

  @override
  State<CreateBankInfoScreen> createState() => _CreateBankInfoScreenState();
}

class _CreateBankInfoScreenState extends State<CreateBankInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox24,
            CustomAppBar(name: 'Fill-up Bank Info', isBack: true),
            heightBox12,
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account number',
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
                        hintText: '123456789',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  heightBox8,
                  Text('Routing number',
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff626262))),
                  heightBox8,
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Enter routing number';

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: '123456789',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  heightBox8,
                  Text('Bank name',
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff626262))),
                  heightBox8,
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Enter bank name';

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'bank name',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  heightBox8,
                  Text('Bankholder name',
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff626262))),
                  heightBox8,
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Enter bankholder name';

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'bankholder name',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  heightBox8,
                  Text('Bank address',
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff626262))),
                  heightBox8,
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Enter bank address';

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'bank address',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
            heightBox12,
            CustomElevatedButton(onPressed: () {}, text: 'Save Info'),
          ],
        ),
      ),
    );
  }


}
