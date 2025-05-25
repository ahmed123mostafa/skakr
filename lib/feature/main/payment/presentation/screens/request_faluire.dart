import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class RequestFailure extends StatefulWidget {
  const RequestFailure({super.key});

  @override
  State<RequestFailure> createState() => _RequestFailureState();
}

class _RequestFailureState extends State<RequestFailure> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pop(context); 
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
            Center(child: Image.asset("assets/images/Hero Illustration.png")),
            SizedBox(height: 70.h),
            Text(
              "يرجي المحاولة مره اخري",
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
