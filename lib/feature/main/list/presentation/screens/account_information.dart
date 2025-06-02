import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/auth/presentation/screens/login_screen.dart';
import 'package:settings_app/feature/main/favourite/presentation/screens/favourites_card.dart';
import 'package:settings_app/feature/main/list/presentation/screens/frequently_question.dart';
import 'package:settings_app/feature/main/list/presentation/screens/policy_privacy.dart';
import 'package:settings_app/feature/main/list/presentation/screens/prevuis_order/screen/previous_order.dart';
import 'package:settings_app/feature/main/list/presentation/screens/profile_screen.dart';
import 'package:settings_app/feature/main/list/presentation/screens/saved_address.dart';
import 'package:settings_app/feature/main/list/presentation/screens/who_are_screen.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w, left: 20.w),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.profile),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "hello,mohamed".tr(),
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                            Text(
                              "account_information".tr(),
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.mainAppColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyPreviousOrders()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 136.w,
                          height: 136.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Image.asset(AppAssets.previosorder),
                              SizedBox(height: 10.h),
                              Text(
                                "my_previous_orders".tr(),
                                style: TextStyle(
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainAppColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FavouritesCard()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 136.w,
                          height: 136.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Image.asset(AppAssets.love),
                              SizedBox(height: 10.h),
                              Text(
                                "favorites".tr(),
                                style: TextStyle(
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainAppColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WhoAreScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 136.w,
                          height: 136.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Image.asset(AppAssets.whoare),
                              SizedBox(height: 10.h),
                              Text(
                                "who_are_we?".tr(),
                                style: TextStyle(
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainAppColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FrequentlyQuestion()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 136.w,
                          height: 136.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Image.asset(AppAssets.icon),
                              SizedBox(height: 10.h),
                              Text(
                                "frequently_asked_questions".tr(),
                                style: TextStyle(
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainAppColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PolicyAndPrivacy()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 136.w,
                          height: 136.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Image.asset(AppAssets.secret),
                              SizedBox(height: 10.h),
                              Text(
                                "policy_and_Privacy".tr(),
                                style: TextStyle(
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainAppColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      GestureDetector(
                        onTap: () {
                          final currentLocale = context.locale;
                          final newLocale = currentLocale.languageCode == 'ar'
                              ? const Locale('en')
                              : const Locale('ar');
                          context.setLocale(newLocale);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 136.w,
                          height: 136.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Image.asset(AppAssets.solid),
                              SizedBox(height: 10.h),
                              Text(
                                "change_language".tr(),
                                style: TextStyle(
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainAppColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SavedAddress()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 136.w,
                          height: 136.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Image.asset(AppAssets.addres),
                              SizedBox(height: 10.h),
                              Text(
                                "saved_addresses".tr(),
                                style: TextStyle(
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainAppColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 136.w,
                          height: 136.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Image.asset(AppAssets.logout),
                              SizedBox(height: 10.h),
                              Text(
                                "sign_out".tr(),
                                style: TextStyle(
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainAppColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
