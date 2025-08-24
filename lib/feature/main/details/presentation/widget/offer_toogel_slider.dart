import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

import 'package:settings_app/core/constant/app_colors.dart';

class OfferToggleSlider extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const OfferToggleSlider({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.languageCode;
    final isRtl = locale == 'ar';
    final toggleWidth = 80.w;
    final containerWidth = toggleWidth * items.length;

    return Padding(
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
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Directionality(
            textDirection: isRtl ? ui.TextDirection.rtl : ui.TextDirection.ltr,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: isRtl
                      ? (items.length - selectedIndex - 1) * toggleWidth
                      : selectedIndex * toggleWidth,
                  child: Container(
                    height: 40.h,
                    width: toggleWidth,
                    decoration: BoxDecoration(
                      color: AppColors.mainAppColor, // أو AppColors.mainAppColor
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: AppColors.mainAppColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: List.generate(items.length, (index) {
                    final isSelected =
                    isRtl ? index == (items.length - selectedIndex - 1) : index == selectedIndex;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => onChanged(index),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Alexandria",
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}