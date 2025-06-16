import 'package:expriy_deals_vendors/app/modules/bank/controllers/create_bank_info_controller.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
              CustomAppBar(name: 'Fill-up Bank Info', isBack: true),
              heightBox12,
              Form(
                key: _formKey,
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
                      controller: _accountNumberController,
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
                      controller: _routingNumberController,
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
                      controller: _bankNameController,
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
                      controller: _bankHolderNameController,
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
                      controller: _bankAddressController,
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
              GetBuilder<CreateBankInfoController>(
                builder: (controller) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomElevatedButton(
                        onPressed: controller.inProgress
                            ? () {}
                            : () => onTapToNextButton(),
                        text: controller.inProgress ? '' : 'Save Info',
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
              // CustomElevatedButton(onPressed: onTapToNextButton, text: 'Save Info'),
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
          showSnackBarMessage(context, 'Card info created');
          Get.back();
          // print('My token ---------------------------------------');
          // print(signUpController.token);
        } else {
          if (mounted) {
            showSnackBarMessage(
                context, createBankInfoController.errorMessage!, true);
          }
        }
      }
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, createBankInfoController.errorMessage!, true);
      }
    }
  }
}
