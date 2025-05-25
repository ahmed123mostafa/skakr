import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class RequestSucceffulyExcuted extends StatelessWidget {
  const RequestSucceffulyExcuted({super.key});

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
            SizedBox(
              height: 40.h,
            ),
            Text("تم تنفيذ الطلب بنجاح",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.mainAppColor,
                    fontWeight: FontWeight.w600)),
                    //////
            SizedBox(
              height: 20.h,
            ),
            Text("يرجي الانتظار",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.mainAppColor,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 80.h,
            ), 
            Image.asset("assets/images/Group 195.png")
          ],
        ),
      ),
    );
  }
}
