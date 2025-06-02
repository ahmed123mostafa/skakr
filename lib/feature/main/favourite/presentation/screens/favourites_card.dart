import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/favourite/presentation/widget/favourite_item.dart';

class FavouritesCard extends StatelessWidget {
  const FavouritesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        appBar: AppBar(
          backgroundColor: const Color(0xffF1F1F1),
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.5),
          centerTitle: true,
          title: Text(
            "favorites".tr(),
            style: TextStyle(
              color: AppColors.mainAppColor,
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.045,
            ),
          ),
          leading: Icon(
            Icons.arrow_back,
            color: AppColors.mainAppColor,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => const FavouriteItem(),
          ),
        ),
      ),
    );
  }
}
