import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/details/presentation/screens/details_screen.dart';

class Customgridview extends StatelessWidget {
  const Customgridview({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: screenWidth * 0.05,
          mainAxisSpacing: screenHeight * 0.025,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: Image.asset(
                          AppAssets.offer,
                          width: double.infinity,
                          height: screenHeight * 0.10,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Text(
                        '5.00_pounds'.tr(),
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: AppColors.mainAppColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Alexandria",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                          vertical: screenHeight * 0.005),
                      child: Text(
                        'al_Noor_orange_juice_egyptian_2kg'.tr(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Alexandria",
                          fontSize: screenWidth * 0.02,
                          color: const Color(0xff231F20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -(screenHeight * 0.02),
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainAppColor,
                      shape: const StadiumBorder(),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenHeight * 0.015,
                      ),
                    ),
                    child: Text(
                      'add_to_cart'.tr(),
                      style: TextStyle(
                        fontFamily: "Alexandria",
                        fontSize: screenWidth * 0.025,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
