import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/feature/main/catagory/manager/category_cubit.dart';
import 'package:settings_app/feature/main/catagory/manager/category_state.dart';

import 'package:settings_app/feature/main/home/presentation/screens/contet_product.dart';

import '../../../catagory/presentation/screens/widget/custom_main_category.dart';


class ContentGrid extends StatelessWidget {
  const ContentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth >= 600 ? 4 : 3;
    final childAspectRatio = screenWidth >= 600 ? 0.9 : 0.8;
    final isArabic = context.locale.languageCode == 'ar';
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          final mainCategoryCubit = BlocProvider.of<CategoryCubit>(context);

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mainCategoryCubit.mainCategoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContentProduct(categoryId:mainCategoryCubit.mainCategoryList[index].categoryId! ,categoryName: isArabic
                          ?  mainCategoryCubit.mainCategoryList[index].categoryArName??''
                          :  mainCategoryCubit.mainCategoryList[index].categoryEnName??'' ,)),

                  );
                },
                child: MainCategoryCard(
                  item: mainCategoryCubit.mainCategoryList[index],
                  screenWidth: screenWidth,
                  crossAxisCount: crossAxisCount,
                ),
              );
            },
          );
        },
      ),
    );
  }
}



