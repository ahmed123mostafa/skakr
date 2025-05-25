import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/payment/presentation/screens/invoice_table_screen.dart';

class RequestSuccessfullyExecuted extends StatefulWidget {
  const RequestSuccessfullyExecuted({super.key});

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
        
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>const InvoiceScreen()));
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
              "تم تنفيذ الطلب بنجاح",
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.mainAppColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "يرجي الانتظار",
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
