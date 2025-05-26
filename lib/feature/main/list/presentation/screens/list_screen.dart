import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_bottom.dart';
import 'package:settings_app/feature/main/list/presentation/screens/frequently_question.dart';
import 'package:settings_app/feature/main/list/presentation/screens/policy_privacy.dart';
import 'package:settings_app/feature/main/list/presentation/screens/who_are_screen.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  borderRadius: 8,
                  width: 150.w,
                  height: 38,
                  fontSize: 12,
                  textColor: Colors.white,
                  text: "login".tr(),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20.w,
                ),
                CustomButton(
                  width: 166.w,
                  height: 38,
                  fontSize: 12,
                  borderRadius: 16,
                  color: Colors.white,
                  textColor: AppColors.mainAppColor,
                  text: "new_registration".tr(),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
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
                        SizedBox(
                          height: 10.h,
                        ),
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
                SizedBox(
                  width: 15.w,
                ),
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
                        SizedBox(
                          height: 10.h,
                        ),
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
            SizedBox(
              height: 30.h,
            ),
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
                        SizedBox(
                          height: 10.h,
                        ),
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
                SizedBox(
                  width: 15.w,
                ),
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
          ],
        ),
      ),
    );
  }
}
