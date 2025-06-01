import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import "dart:ui" as ui;

class OfferToggleSlider extends StatefulWidget {
  const OfferToggleSlider({super.key});

  @override
  State<OfferToggleSlider> createState() => _OfferToggleSliderState();
}

class _OfferToggleSliderState extends State<OfferToggleSlider> {
  int isOffersSelected = 0;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final locale = context.locale.languageCode;
      isOffersSelected = locale == 'ar' ? 0 : 1;
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final toggleWidth = 80.w;
    final containerWidth = 140.w;
    final locale = context.locale.languageCode;

    // تعديل المنطق هنا:
    // لما العربية والاختيار 0 -> basket مختار
    // لما غير العربية والاختيار 1 -> basket مختار (عشان بالانجليزي التبديل)
    bool isBasketChosen = (locale == 'ar' && isOffersSelected == 0) ||
        (locale != 'ar' && isOffersSelected == 1);
    bool isPackageChosen = !isBasketChosen;

    return GestureDetector(
      onTap: () {
        setState(() {
          isOffersSelected = isOffersSelected == 0 ? 1 : 0;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 40.h,
            width: containerWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Directionality(
              textDirection:
                  locale == 'ar' ? ui.TextDirection.rtl : ui.TextDirection.ltr,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: isOffersSelected == 0 ? 0 : toggleWidth,
                    right: isOffersSelected == 0 ? toggleWidth : 0,
                    child: Container(
                      height: 40.h,
                      width: toggleWidth,
                      decoration: BoxDecoration(
                        color: AppColors.mainAppColor,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: AppColors.mainAppColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'basket'.tr(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Alexandria",
                              color:
                                  isBasketChosen ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'package'.tr(),
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Alexandria",
                              color:
                                  isPackageChosen ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
