import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({super.key});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  int quantity = 0;
  bool showCounter = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final locale = context.locale;

    return Card(
      color: AppColors.backgroundAppColor,
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppAssets.apple,
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.12,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 4,
                  child: showCounter
                      ? Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainAppColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.015,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (quantity > 1) {
                                    setState(() => quantity--);
                                  } else {
                                    setState(() {
                                      quantity = 0;
                                      showCounter = false;
                                    });
                                  }
                                },
                                child: Icon(Icons.remove,
                                    size: screenWidth * 0.045,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.015),
                                child: Text(
                                  '$quantity',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() => quantity++);
                                },
                                child: Icon(Icons.add,
                                    size: screenWidth * 0.045,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity = 1;
                              showCounter = true;
                            });
                          },
                          child: CircleAvatar(
                            radius: screenWidth * 0.045,
                            backgroundColor: AppColors.mainAppColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: screenWidth * 0.05,
                            ),
                          ),
                        ),
                )
              ],
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'imported_green_apples_1kg'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.030,
                      color: const Color(0xff231F20),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    '5.00_pounds'.tr(),
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainAppColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Align(
                    alignment: locale == const Locale('ar')
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainAppColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.005,
                        ),
                      ),
                      child: Text(
                        'view_details'.tr(),
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: AppColors.backgroundAppColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
