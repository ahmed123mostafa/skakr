import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/payment/presentation/screens/invoice_table_screen.dart';

import '../../model/order_summry_model.dart';

class RequestSuccessfullyExecuted extends StatefulWidget {
  OrderSummryModel? orderSummryModel;
  dynamic invoiceNumber;
 RequestSuccessfullyExecuted({super.key,required this.orderSummryModel,required this.invoiceNumber});

  @override
  State<RequestSuccessfullyExecuted> createState() =>
      _RequestSuccessfullyExecutedState();
}

class _RequestSuccessfullyExecutedState
    extends State<RequestSuccessfullyExecuted> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pop(context);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => InvoiceScreen(invoiceNumber: widget.invoiceNumber,orderSummryModel: widget.orderSummryModel,)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF3F3F3),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/pana.png")),
            SizedBox(height: 40.h),
            Text(
              "the request has been successfully executed.".tr(),
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.mainAppColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Please wait".tr(),
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.mainAppColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 80.h),
            Image.asset("assets/images/Group 195.png"),
          ],
        ),
      ),
    );
  }
}
