import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/details/presentation/screens/details_screen.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_grid_views.dart';

class OrderAgain extends StatelessWidget {
  const OrderAgain({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.025), // 2.5% من ارتفاع الشاشة
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05), // 5% من العرض
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(right: screenWidth * 0.05),
                        width: screenWidth * 0.4, // 40% من العرض
                        height: screenHeight * 0.06, // 6% من ارتفاع الشاشة
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
                            SizedBox(width: screenWidth * 0.05),
                            Text(
                              "order_again".tr(),
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize:
                                    screenWidth * 0.045, // حجم خط نسبي للعرض
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
                        width: screenWidth * 0.2, // 20% من العرض
                        height: screenHeight * 0.06,
                        decoration: BoxDecoration(
                          color: const Color(0xffF1F1F1),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
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
                                fontSize: screenWidth * 0.06, // 6% من العرض
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
              const Customgridview(),
            ],
          ),
        ),
      ),
    );
  }
}
