
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';


import '../../../../core/constant/app_assets.dart';
import '../../../../core/constant/app_colors.dart';

import '../../../../core/constant/custom_bottom.dart';
import '../screens/login_screen.dart';

void showAccountExistsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                AppAssets.warning,
                width: 120,
                height: 120,
                repeat: false,
              ),
              const SizedBox(height: 10),
              Text(
                'account_exists'.tr(),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainAppColor,
                  fontFamily: "Alexandria",
                ),
              ),
            
              const SizedBox(height: 8),
              Text(
               'account_exists_message'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(  fontFamily: "Alexandria",fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.hitColor),
              ),
              const SizedBox(height: 20),
              CustomButton(

                text: 'login'.tr(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){


                    return LoginScreen();
                  }));


                },


                textColor: Colors.white,

              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'create_new_account'.tr(),
                onPressed: ()  {
                  Navigator.pop(context);

                },
color:  AppColors.mainAppColor,


                textColor: Colors.white,

              ),
            ],
          ),
        ),
      );
    },
  );
}
