import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class CustomMarque extends StatelessWidget {
  const CustomMarque({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Marquee(
          text:
              'wait_for_us_soon_wait_for_us_soon_wait_for_us_soon_wait_for_us_soon'
                  .tr(),
          style: TextStyle(
            color: AppColors.mainAppColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          blankSpace: 50.0,
          velocity: 40.0,
          pauseAfterRound: const Duration(seconds: 0),
          startPadding: 10.0,
          accelerationDuration: const Duration(seconds: 1),
          decelerationDuration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
