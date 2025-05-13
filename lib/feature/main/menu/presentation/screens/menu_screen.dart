import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffF1F1F1),
          body: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Image.asset(AppAssets.cart23),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "cart".tr(),
                      style: TextStyle(
                        fontFamily: "Alexandria",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainAppColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Image.asset(AppAssets.cart234),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  "تبحث عن شئ؟".tr(),
                  style: TextStyle(
                    fontFamily: "Alexandria",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainAppColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  "اضف ما تريد الي سلة التسوق الخاصة بك".tr(),
                  style: TextStyle(
                    fontFamily: "Alexandria",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffAAAAAA),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
