import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class CarsodalSliderTwo extends StatelessWidget {
  const CarsodalSliderTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isArabic = context.locale.languageCode == 'ar';

    return CarouselSlider(
      items: List.generate(
        4,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.banner2,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  left: isArabic ? null : 8,
                  right: isArabic ? 8 : null,
                  top: screenHeight * 0.12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.backgroundAppColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: AppColors.mainAppColor,
                          size: 15.sp,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          'shop now'.tr(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.mainAppColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Alexandria",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        height: 140.h,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        scrollPhysics: const BouncingScrollPhysics(),
      ),
    );
  }
}
