import 'package:expriy_deals_vendors/app/modules/widthraw/controllers/my_widthdrae_controller.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/controllers/widthdraw_request_controller.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WidthdrawRequestScreen extends StatefulWidget {
  const WidthdrawRequestScreen({super.key});

  @override
  State<WidthdrawRequestScreen> createState() => _WidthdrawRequestScreenState();
}

class _WidthdrawRequestScreenState extends State<WidthdrawRequestScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  final WidthdrawRequestController widthdrawRequestController =
      Get.put(WidthdrawRequestController());
      final MyWidthdrawController _myWidthdrawController =
      Get.find<MyWidthdrawController>();

      
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
              key: _formKey,
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
                    controller: amountController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Enter amount';

                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'amount',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  heightBox8,
                ],
              ),
            ),
            heightBox100,
            GetBuilder<WidthdrawRequestController>(
              builder: (controller) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomElevatedButton(
                      onPressed: controller.inProgress
                          ? () {}
                          : () => onTapToNextButton(),
                      text: controller.inProgress ? '' : 'Submit Request',
                    ),
                    if (controller.inProgress)
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await widthdrawRequestController.widthdrawRequest(
        amountController.text.isNotEmpty ? int.parse(amountController.text) : 0,
      );

      if (isSuccess) {
        if (mounted) {
          _myWidthdrawController.getWidthdraw();
          showSnackBarMessage(context, 'Widthdraw successfully done');
          Get.back();
        } else {
          if (mounted) {
            showSnackBarMessage(
                context, widthdrawRequestController.errorMessage!, true);
          }
        }
      }
    }
  }

  void clearTextField() {}

  @override
  void dispose() {
    super.dispose();
  }
}
