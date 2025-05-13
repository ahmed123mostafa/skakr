import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1F1F1),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.5),
        centerTitle: true,
        title: Text(
          "my_personal_account".tr(),
          style: TextStyle(
            color: AppColors.mainAppColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: AppColors.mainAppColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: const Color(0xffCCDDE2),
              child: Icon(Icons.person, size: 50.r, color: Colors.black),
            ),
            SizedBox(height: 10.h),
            const Text("محمد سمير",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            buildInfoContainer("محمد", AppAssets.firstname),
            buildInfoContainer("سمير", AppAssets.firstname),
            buildInfoContainer("0704065550", AppAssets.phonenumber),
            buildInfoContainer("msa***@gmail.com", AppAssets.email),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainAppColor,
                  foregroundColor: Colors.white, // Sets icon and text color
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.lock_outline, color: Colors.white),
                label: const Text(
                  "تغيير كلمة المرور",
                  style: TextStyle(color: Colors.white), 
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    foregroundColor: AppColors
                        .mainAppColor, 
                  ),
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.mainAppColor,
                  ),
                  label: const Text("حذف الحساب"),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoContainer(String value, String imagePath) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 24.w, height: 24.h),
          SizedBox(
            width: 10.w,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
