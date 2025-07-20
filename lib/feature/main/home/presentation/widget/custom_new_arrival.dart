import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';


class NewArrivalcart extends StatelessWidget {
  const NewArrivalcart({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final containerWidth = screenWidth * 0.45;
    final containerHeight = containerWidth * 1.2;
    final imageWidth = containerWidth * 0.5;
    final buttonHorizontalPadding = containerWidth * 0.12;
    const buttonVerticalPadding = 10.0;
    final fontSizePrice = screenWidth * 0.045;
    final fontSizeTitle = screenWidth * 0.022;
    final fontSizeButton = screenWidth * 0.028;

    return SizedBox(
      height: containerHeight + 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 9,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 6),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: containerHeight * 0.16,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Image.asset(
                                AppAssets.offer,
                                width: imageWidth,
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
                                    Center(
                                      child: Text(
                                        '10%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: fontSizePrice * 0.8,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "offers".tr(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: fontSizePrice * 0.7,
                                          fontWeight: FontWeight.w700,
                                        ),
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
                            child:
                                Icon(Icons.favorite_border, color: Colors.grey),
                          ),
                          Positioned(
                            top: containerHeight * 0.5,
                            right: 12,
                            left: 12,
                            child: Text(
                              '5.00_pounds'.tr(),
                              style: TextStyle(
                                fontSize: fontSizePrice,
                                color: AppColors.mainAppColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Alexandria",
                              ),
                            ),
                          ),
                          Positioned(
                            top: containerHeight * 0.63,
                            right: 12,
                            left: 12,
                            child: Text(
                              'al_Noor_orange_juice_egyptian_2kg'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Alexandria",
                                fontSize: fontSizeTitle,
                                color: const Color(0xff231F20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -15,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainAppColor,
                            shape: const StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                              horizontal: buttonHorizontalPadding,
                              vertical: buttonVerticalPadding,
                            ),
                          ),
                          child: Text(
                            'add_to_cart'.tr(),
                            style: TextStyle(
                              fontFamily: "Alexandria",
                              fontSize: fontSizeButton,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: containerWidth,
                      height: containerHeight,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 6),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: containerHeight * 0.16,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Image.asset(
                                AppAssets.offer,
                                width: imageWidth,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            left: 0,
                            child:
                                Icon(Icons.favorite_border, color: Colors.grey),
                          ),
                          Positioned(
                            top: containerHeight * 0.5,
                            right: 12,
                            left: 12,
                            child: Text(
                              '5.00_pounds'.tr(),
                              style: TextStyle(
                                fontSize: fontSizePrice,
                                color: AppColors.mainAppColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Alexandria",
                              ),
                            ),
                          ),
                          Positioned(
                            top: containerHeight * 0.63,
                            right: 12,
                            left: 12,
                            child: Text(
                              'al_Noor_orange_juice_egyptian_2kg'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Alexandria",
                                fontSize: fontSizeTitle,
                                color: const Color(0xff231F20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -7,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainAppColor,
                            shape: const StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                              horizontal: buttonHorizontalPadding,
                              vertical: buttonVerticalPadding,
                            ),
                          ),
                          child: Text(
                            'add_to_cart'.tr(),
                            style: TextStyle(
                              fontFamily: "Alexandria",
                              fontSize: fontSizeButton,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
