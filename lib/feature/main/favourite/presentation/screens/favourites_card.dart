import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class FavouritesCard extends StatelessWidget {
  const FavouritesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        appBar: AppBar(
          backgroundColor: const Color(0xffF1F1F1),
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.5),
          centerTitle: true,
          title: Text(
            "favorites".tr(),
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
        body: ListView.builder(
          padding: EdgeInsets.all(12.w),
          itemCount: 4,
          itemBuilder: (context, index) => const FavouriteItem(),
        ),
      ),
    );
  }
}

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({super.key});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  int quantity = 0;
  bool showCounter = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundAppColor,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppAssets.apple,
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 4,
                  child: showCounter
                      ? Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainAppColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (quantity > 1) {
                                    setState(() => quantity--);
                                  } else {
                                    setState(() {
                                      quantity = 0;
                                      showCounter = false;
                                    });
                                  }
                                },
                                child: Icon(Icons.remove,
                                    size: 18.sp, color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Text(
                                  '$quantity',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() => quantity++);
                                },
                                child: Icon(Icons.add,
                                    size: 18.sp, color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity = 1;
                              showCounter = true;
                            });
                          },
                          child: CircleAvatar(
                            radius: 18.r,
                            backgroundColor: AppColors.mainAppColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                )
              ],
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تفاح أخضر مستورد اكجم',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: const Color(0xff231F20),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '5 جنيه',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainAppColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainAppColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 4.h,
                        ),
                      ),
                      child: Text(
                        'عرض التفاصيل',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.backgroundAppColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
