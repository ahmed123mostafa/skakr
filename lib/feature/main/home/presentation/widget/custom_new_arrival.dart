import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

import 'custom_quantity_counter.dart';

class NewArrivalcart extends StatelessWidget {
  const NewArrivalcart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 190,
                      height: 228,
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
                            top: 40,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Image.asset(
                                AppAssets.offer,
                                width: 90,
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
                                    const Center(
                                      child: Text(
                                        '10%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'offers'.tr(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
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
                            top: 120,
                            right: 12,
                            left: 12,
                            child: Text(
                              '5.00_pounds'.tr(),
                              style: TextStyle(
                                fontSize: 17,
                                color: AppColors.mainAppColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Alexandria",
                              ),
                            ),
                          ),
                          Positioned(
                            top: 145,
                            right: 12,
                            left: 12,
                            child: Text(
                              'al_Noor_orange_juice_egyptian_2kg'.tr(),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Alexandria",
                                fontSize: 9,
                                color: Color(0xff231F20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: -10,
                      left: 0,
                      right: 0,
                      child: Center(child: QuantityCounter()),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 190,
                      height: 228,
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
                            top: 40,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Image.asset(
                                AppAssets.offer,
                                width: 90,
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
                            top: 120,
                            right: 12,
                            left: 12,
                            child: Text(
                              '5.00_pounds'.tr(),
                              style: TextStyle(
                                fontSize: 17,
                                color: AppColors.mainAppColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Alexandria",
                              ),
                            ),
                          ),
                          Positioned(
                            top: 145,
                            right: 12,
                            left: 12,
                            child: Text(
                              'al_Noor_orange_juice_egyptian_2kg'.tr(),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Alexandria",
                                fontSize: 9,
                                color: Color(0xff231F20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -8,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainAppColor,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                          ),
                          child: Text(
                            'add_to_cart'.tr(),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
