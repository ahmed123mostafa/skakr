import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.favouretes),
            Text(
              "ليس لديك قائمة مفضلة بعد  ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "وفر الوقت",
              style: TextStyle(
                  color: AppColors.mainAppColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "اضف منتجاتك الاساسية والمفضلة ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "لتكن جميعها في سلة واحده ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
          ]),
    );
  }
}
