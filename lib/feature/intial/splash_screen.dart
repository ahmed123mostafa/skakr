import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/api/dio_concumer.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/feature/auth/presentation/screens/choose_country.dart';
import 'package:settings_app/feature/main/home/presentation/screens/home_screen.dart';

import '../../core/api/end_point.dart';
import '../../core/constant/conatant.dart';
import '../auth/presentation/screens/login_screen.dart';
import '../main/home/presentation/home_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {

      if (beasUrlCairoOrMa == null) {

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ChooseBranchScreen()),
              (route) => false,
        );
      } else if (CustomerID == null) {

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
        );
      } else {

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
              (route) => false,
        );
      }






    });

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: -1, end: 0),
              duration: const Duration(seconds: 3),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, value * screenHeight * 0.5),
                  child: Image.asset(AppAssets.iconlogo, fit: BoxFit.contain),
                );
              },
            ),
            SizedBox(height: 15.h,),

            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 1, end: 0),
              duration: const Duration(seconds: 3),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, value * screenHeight * 0.5),
                  child: Image.asset(AppAssets.textlogo, fit: BoxFit.contain),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
