import 'package:expriy_deals_vendors/app/modules/bank/controllers/bank_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/bank/controllers/update_bank_info_controller.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateBankInfoScreen extends StatefulWidget {
  final String accountId;
  const UpdateBankInfoScreen({super.key, required this.accountId});

  @override
  State<UpdateBankInfoScreen> createState() => _UpdateBankInfoScreenState();
}

class _UpdateBankInfoScreenState extends State<UpdateBankInfoScreen> {
  final UpdateBankInfoController updateBankInfoController =
      Get.find<UpdateBankInfoController>();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _routingNumberController =
      TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _bankHolderNameController =
      TextEditingController();
  final TextEditingController _bankAddressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final BankDetailsController bankDetailsController =
      Get.find<BankDetailsController>();

  @override
  void initState() {
    bankDetailsController.getBankData();
    _accountNumberController.text =
        bankDetailsController.bankDetailsData?.accountNumber ?? '';
    _routingNumberController.text =
        bankDetailsController.bankDetailsData?.routingNumber ?? '';
    _bankNameController.text =
        bankDetailsController.bankDetailsData?.bankName ?? '';
    _bankHolderNameController.text =
        bankDetailsController.bankDetailsData?.bankHolderName ?? '';
    _bankAddressController.text =
        bankDetailsController.bankDetailsData?.bankAddress ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox24,
            CustomAppBar(name: 'Update Bank Info', isBack: true),
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
            GetBuilder<UpdateBankInfoController>(
              builder: (controller) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomElevatedButton(
                      onPressed: controller.inProgress
                          ? () {}
                          : () => onTapToNextButton(),
                      text: controller.inProgress ? '' : 'Update Bank Info',
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
      final bool isSuccess = await updateBankInfoController.updateCardInfo(
        widget.accountId,
        _accountNumberController.text,
        _routingNumberController.text,
        _bankNameController.text,
        _bankHolderNameController.text,
        _bankAddressController.text,
      );

      if (isSuccess) {
        if (mounted) {
          showSnackBarMessage(context, 'Card info updated successfully', false);
          Get.back();
          // print('My token ---------------------------------------');
          // print(signUpController.token);
        } else {
          if (mounted) {
            showSnackBarMessage(
                context, updateBankInfoController.errorMessage!, true);
          }
        }
      }
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, updateBankInfoController.errorMessage!, true);
      }
    }
  }
}
