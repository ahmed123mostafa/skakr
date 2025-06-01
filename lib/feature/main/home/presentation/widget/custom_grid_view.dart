import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/home/presentation/screens/contet_product.dart';

class ContentGrid extends StatefulWidget {
  const ContentGrid({super.key});

  @override
  State<ContentGrid> createState() => _ContentGridState();
}

class _ContentGridState extends State<ContentGrid> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _allItems = [
    {'title': 'offers'.tr(), 'image': AppAssets.offers},
    {
      'title': 'fruits_and_vegetables'.tr(),
      'image': AppAssets.fruitsandvegetables
    },
    {'title': 'fresh_food'.tr(), 'image': AppAssets.freshfood},
    {'title': 'baked'.tr(), 'image': AppAssets.baked},
    {'title': 'poultry_meat_seafood'.tr(), 'image': AppAssets.meat},
    {'title': 'ready_to_eat'.tr(), 'image': AppAssets.readytoeat},
    {'title': 'offers'.tr(), 'image': AppAssets.offers},
    {
      'title': 'fruits_and_vegetables'.tr(),
      'image': AppAssets.fruitsandvegetables
    },
    {'title': 'fresh_food'.tr(), 'image': AppAssets.freshfood},
    {'title': 'baked'.tr(), 'image': AppAssets.baked},
    {'title': 'poultry_meat_seafood'.tr(), 'image': AppAssets.meat},
    {'title': 'ready_to_eat'.tr(), 'image': AppAssets.readytoeat},
    {'title': 'offers'.tr(), 'image': AppAssets.offers},
    {
      'title': 'fruits_and_vegetables'.tr(),
      'image': AppAssets.fruitsandvegetables
    },
    {'title': 'fresh_food'.tr(), 'image': AppAssets.freshfood},
    {'title': 'baked'.tr(), 'image': AppAssets.baked},
    {'title': 'poultry_meat_seafood'.tr(), 'image': AppAssets.meat},
    {'title': 'ready_to_eat'.tr(), 'image': AppAssets.readytoeat},
    {'title': 'offers'.tr(), 'image': AppAssets.offers},
    {
      'title': 'fruits_and_vegetables'.tr(),
      'image': AppAssets.fruitsandvegetables
    },
    {'title': 'fresh_food'.tr(), 'image': AppAssets.freshfood},
    {'title': 'baked'.tr(), 'image': AppAssets.baked},
    {'title': 'poultry_meat_seafood'.tr(), 'image': AppAssets.meat},
    {'title': 'ready_to_eat'.tr(), 'image': AppAssets.readytoeat},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth >= 600 ? 4 : 3;
    final childAspectRatio = screenWidth >= 600 ? 0.9 : 0.8;

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: GridView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12.w,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: _allItems.length,
        itemBuilder: (context, index) {
          return buildGridItem(_allItems[index], screenWidth, crossAxisCount);
        },
      ),
    );
  }

  Widget buildGridItem(
      Map<String, String> item, double screenWidth, int crossAxisCount) {
    final itemWidth =
        (screenWidth - 32.w - (crossAxisCount - 1) * 12.w) / crossAxisCount;
    final imageSize = itemWidth * 0.9;
    final containerHeight = imageSize * 0.34;

    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ContentProduct()));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              item['image']!,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: imageSize,
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                item['title']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainAppColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
