import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/details/presentation/screens/details_screen.dart';

class OrderAgain extends StatelessWidget {
  const OrderAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              "order_again".tr(),
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 16.sp,
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
              const Customgridview()
            ],
          ),
        ),
      ),
    );
  }
}

class Customgridview extends StatelessWidget {
  const Customgridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 40,
            mainAxisSpacing: 20,
            childAspectRatio: 1.3, // Adjusted to allow taller items
          ),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 220.w,
                        height: 240.h, // Increased height
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(),
                                    ));
                              },
                              child: Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      AppAssets.offer,
                                      width: 100.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset("assets/images/Vector 356.png"),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '10%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'OFF',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              left: 0,
                              child: Icon(Icons.favorite_border,
                                  color: Colors.grey),
                            ),
                            Positioned(
                              top: 140.h, // Adjusted for taller container
                              right: 12.w,
                              child: Text(
                                '5.00 جنيه',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.mainAppColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Alexandria",
                                ),
                              ),
                            ),
                            Positioned(
                              top: 165.h,
                              right: 12.w,
                              left: 12.w,
                              child: Text(
                                'النور برتقال عصير مصري 2كجم',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  color: const Color(0xff231F20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -15.h,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainAppColor,
                              shape: const StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 10.h),
                            ),
                            child: Text(
                              'إضافة للسلة',
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                Flexible(
                  flex: 1,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 220.w,
                        height: 240.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(),
                                    ));
                              },
                              child: Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      AppAssets.offer,
                                      width: 100.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              left: 0,
                              child: Icon(Icons.favorite, color: Colors.red),
                            ),
                            Positioned(
                              top: 140.h,
                              right: 12.w,
                              child: Text(
                                '5.00 جنيه',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.mainAppColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Alexandria",
                                ),
                              ),
                            ),
                            Positioned(
                              top: 165.h,
                              right: 12.w,
                              left: 12.w,
                              child: Text(
                                'النور برتقال عصير مصري 2كجم',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Alexandria",
                                  fontSize: 11.sp,
                                  color: const Color(0xff231F20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -15.h,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainAppColor,
                              shape: const StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 10.h),
                            ),
                            child: Text(
                              'إضافة للسلة',
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
