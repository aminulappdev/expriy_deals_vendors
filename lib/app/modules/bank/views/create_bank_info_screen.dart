import 'package:expriy_deals_vendors/app/modules/bank/controllers/create_bank_info_controller.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/Get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBankInfoScreen extends StatefulWidget {
  const CreateBankInfoScreen({super.key});

  @override
  State<CreateBankInfoScreen> createState() => _CreateBankInfoScreenState();
}

class _CreateBankInfoScreenState extends State<CreateBankInfoScreen> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _routingNumberController =
      TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _bankHolderNameController =
      TextEditingController();
  final TextEditingController _bankAddressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CreateBankInfoController createBankInfoController =
      Get.find<CreateBankInfoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox24,
              CustomAppBar(name: 'create_bank_info_screen.title'.tr, isBack: true),
              heightBox12,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('create_bank_info_screen.account_number'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: _accountNumberController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'create_bank_info_screen.enter_account_number'.tr;
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: '123456789',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('create_bank_info_screen.routing_number'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: _routingNumberController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'create_bank_info_screen.enter_routing_number'.tr;
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: '123456789',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('create_bank_info_screen.bank_name'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: _bankNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'create_bank_info_screen.enter_bank_name'.tr;
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'bank name',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('create_bank_info_screen.bank_holder_name'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: _bankHolderNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'create_bank_info_screen.enter_bank_holder_name'.tr;
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'bankholder name',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('create_bank_info_screen.bank_address'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: _bankAddressController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'create_bank_info_screen.enter_bank_address'.tr;
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
              GetBuilder<CreateBankInfoController>(
                builder: (controller) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomElevatedButton(
                        onPressed: controller.inProgress
                            ? () {}
                            : () => onTapToNextButton(),
                        text: controller.inProgress ? '' : 'create_bank_info_screen.save_button'.tr,
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
      ),
    );
  }

  Future<void> onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await createBankInfoController.createCardInfo(
        _accountNumberController.text,
        _routingNumberController.text,
        _bankNameController.text,
        _bankHolderNameController.text,
        _bankAddressController.text,
      );

      if (isSuccess) {
        if (mounted) {
          showSnackBarMessage(context, 'create_bank_info_screen.success_message'.tr);
          Get.back();
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, createBankInfoController.errorMessage ?? 'create_bank_info_screen.error_message'.tr, true);
        }
      }
    }
  }
}