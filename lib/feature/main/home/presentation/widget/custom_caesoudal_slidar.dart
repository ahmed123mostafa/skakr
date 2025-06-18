import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

import '../../manager/cubit/home_cubit.dart';

class CustomCaesoudalSlidar extends StatelessWidget {
  const CustomCaesoudalSlidar({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isArabic = context.locale.languageCode == 'ar';

    return  BlocBuilder<HomeCubit, HomeState>(


        builder: (context, state) {
          if (BlocProvider.of<HomeCubit>(context).bannerOneImageList.isEmpty) {
            return   Image.asset(
              AppAssets.banner,
              fit: BoxFit.cover,
              width: double.infinity,
            );
          }
        return Visibility(
          visible: BlocProvider.of<HomeCubit>(context).bannerOneImageList[0].showGroup != 0,
          replacement: const SizedBox(),
          child: CarouselSlider.builder(

            itemCount:BlocProvider.of<HomeCubit>(context).bannerOneImageList.length,

              itemBuilder: (context, index, realIndex) {
                return
Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      CachedNetworkImage(

                        fit: BoxFit.cover,
                        width: double.infinity,
                        imageUrl:
                        BlocProvider.of<HomeCubit>(context).bannerOneImageList[index].imagePath,
                        placeholder: (context, url) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: 1.0,
                              color: AppColors.mainAppColor,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        fadeInDuration: const Duration(seconds: 1),
                        height: 100.h,

                      ),
                      Positioned(
                        left: isArabic ? null : 8,
                        right: isArabic ? 8 : null,
                        top: screenHeight * 0.10,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.backgroundAppColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'shop now'.tr(),
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.mainAppColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Alexandria",
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.mainAppColor,
                                size: 8.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );


              },




            options: CarouselOptions(
              height: 140.h,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              scrollPhysics: const BouncingScrollPhysics(),
            ),
          ),
        );
      }
    );
  }
}
