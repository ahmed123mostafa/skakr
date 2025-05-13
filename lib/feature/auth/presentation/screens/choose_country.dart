import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/custom_bottom.dart';
import 'package:settings_app/feature/auth/presentation/screens/login_screen.dart';
import 'package:settings_app/feature/auth/presentation/widget/wave_background_painter.dart';

class ChooseBranchScreen extends StatelessWidget {
  const ChooseBranchScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: CustomPaint(
            painter: WaveBackgroundPainter(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 60,
                    ),
                    child: Image.asset(AppAssets.logo, width: screenWidth),
                  ),
                 
                  Container(
                    width: MediaQuery.sizeOf(context).width * .8,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.location),
                        SizedBox(height: 8.h),
                        Text(
                          'select_branch'.tr(),
                          style: TextStyle(
                            fontFamily: "Alexandria",
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                            color:const  Color(0xff5B173E),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        CustomButton(
                          text: "cairo_branch".tr(),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>const LoginScreen(),
                              ),
                            );
                          },
                          width: 260,
                          borderRadius: 20,
                          height: 43,
                          fontSize: 16,
                        ),
                        SizedBox(height: 20.h),
                        CustomButton(
                          text: "mansoura_Branch".tr(),
                          borderRadius: 20,
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>const LoginScreen(),
                              ),
                            );
                          },
                          width: 260,
                          height: 43,
                          fontSize: 16,
                        ),
                      ],
                    ),
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
