import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/home/presentation/screens/order_again.dart';

class ContentProduct extends StatelessWidget {
  const ContentProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        width: 107,
                        height: 43,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: AppColors.mainAppColor,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "دواجن، لحوم ومأكولات بحرية".tr(),
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 107,
                        height: 43,
                        decoration: BoxDecoration(
                          color: const Color(0xffF1F1F1),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.3), // updated for visible shadow
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "2",
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Image.asset(AppAssets.menuuu),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CarouselSlider(
                items: List.generate(
                  4,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppAssets.banner2,
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
              ),
              SizedBox(
                height: 15.h,
              ),
              const CategorySelector(),
              SizedBox(
                height: 20.h,
              ),
              DrinkSelector(),
              const Customgridview()
            ],
          ),
        ),
      ),
    );
  }
}

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = ['الكل', 'دواجن', 'لحوم', 'مأكولات بحرية'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.mainAppColor : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isSelected
                      ? [
                          const BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.mainAppColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: "Alexandria",
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DrinkSelector extends StatefulWidget {
  @override
  _DrinkSelectorState createState() => _DrinkSelectorState();
}

class _DrinkSelectorState extends State<DrinkSelector> {
  int selectedIndex = 0;

  final List<Map<String, String>> drinks = [
    {'image': 'assets/images/Group 64.png'},
    {'image': 'assets/images/Layer 1.png'},
    {'image': 'assets/images/Group 67.png'},
    {'image': 'assets/images/Layer 1 (1).png'},
    {'image': 'assets/images/Group 65 (1).png'},
    {'image': 'assets/images/شعار_مشروب_ريد_بل.svg 1.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedIndex == index
                          ? AppColors.mainAppColor
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(drinks[index]['image']!),
                    radius: 25,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
