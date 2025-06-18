import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../home/presentation/screens/contet_product.dart';
import '../../../model/main_category_model.dart';
class MainCategoryCard extends StatelessWidget {
  final MainCategoryModel item;
  final double screenWidth;
  final int crossAxisCount;

  const MainCategoryCard({
    Key? key,
    required this.item,
    required this.screenWidth,
    required this.crossAxisCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemWidth =
        (screenWidth - 32.w - (crossAxisCount - 1) * 12.w) / crossAxisCount;
    final imageSize = itemWidth * 0.9;
    final containerHeight = imageSize * 0.34;
    final isArabic = context.locale.languageCode == 'ar';
    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ContentProduct(categoryId:item.categoryId! ,categoryName: isArabic
              ?  item.categoryArName??''
              :  item.categoryEnName??'' ,)),
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child:
            CachedNetworkImage(
              width: imageSize,
              height: imageSize,
              fit: BoxFit.contain,
              imageUrl: item.categoryImage!,
              placeholder: (context, url) => Skeletonizer(
                enabled: true,
                child: Center(
                  child: Icon(Icons.image, size: imageSize),
                ),
              ),

            ),),

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
                isArabic
                    ?  item.categoryArName??''
                    :  item.categoryEnName??''
               ,
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