import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';

class CustomCaesoudalSlidar extends StatelessWidget {
  const CustomCaesoudalSlidar({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        4,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              AppAssets.banner,
              fit: BoxFit.cover,
              width: double.infinity,
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
