import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/catagory/manager/category_cubit.dart';
import 'package:settings_app/feature/main/catagory/manager/category_state.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_grid_views.dart';

class ContentProduct extends StatelessWidget {
  final num categoryId;
  final String categoryName;
  const ContentProduct({super.key,required this.categoryName,required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context)=>CategoryCubit()..getSubCategory(mainCategoryId: categoryId)..getItemsForSubCategory(subCategoryId: categoryId)..getBrandsBySubCategory(subCategoryId: categoryId),
            child:


            BlocBuilder<CategoryCubit,CategoryState>(
              builder: (context,state) {
                CategoryCubit categoryCubit=BlocProvider.of<CategoryCubit>(context);
                return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.only(right: 20),
                              width: 107,
                              height: 43,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon( Icons.arrow_back,
                                      color: AppColors.mainAppColor,),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },

                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    categoryName,
                                    style: TextStyle(
                                      fontFamily: "Alexandria",
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.mainAppColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 107,
                              height: 43,
                              decoration: BoxDecoration(
                                color: const Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(
                                        0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      fontFamily: "Alexandria",
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.mainAppColor,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Image.asset(AppAssets.menuuu),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 15.h,
                    ),

                    SubCategorySelector(
                      categoryCubit:categoryCubit ,
                      selectedIndex: categoryCubit.subCategorySelect,
                      onTap: (index) => categoryCubit.changeSelectedCategory(index: index),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DrinkSelector(categoryCubit:categoryCubit ,
                        categoryId: categoryId,
                        selectedIndex: categoryCubit.brandSelect,
                     ),
                    Customgridview(categoryCubit:categoryCubit ,)
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategorySelector extends StatelessWidget {
  final CategoryCubit categoryCubit;
  final int selectedIndex;
  final Function(int) onTap;

  const SubCategorySelector({
    super.key,
    required this.categoryCubit,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {


    return
      (categoryCubit.subCategoryList.isNotEmpty)?
      SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryCubit.subCategoryList.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                categoryCubit.changeSelectedCategory(index: index);
                categoryCubit.getItemsForSubCategory(subCategoryId:  categoryCubit.subCategoryList[index].categoryId);




                categoryCubit.getBrandsBySubCategory(subCategoryId:  categoryCubit.subCategoryList[index].categoryId);

              },
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.mainAppColor : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isSelected
                      ? [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ]
                      : [],
                ),
                child:

                Text(
                  categoryCubit.subCategoryList[index].categoryArName??'',
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.mainAppColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: "Alexandria",
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ):const SizedBox();
  }
}

class DrinkSelector extends StatelessWidget {
  final CategoryCubit categoryCubit;
  final int selectedIndex;
  var categoryId;

 DrinkSelector({
    super.key,
    required this.categoryCubit,
    required this.selectedIndex,
required this.categoryId
  });




  @override
  Widget build(BuildContext context) {
    return
      (categoryCubit.brandList[0].brands.isEmpty)?const SizedBox():
      SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryCubit.brandList[0].brands.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {

              categoryCubit.changeSelectedBrand(index: index);
              categoryCubit.brandSelect=-1;
              categoryCubit.getItemsForBrandCategory(categoryId: categoryId,brandId: categoryCubit.brandList[0].brands[index].fabricID);


            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedIndex == index
                      ? AppColors.mainAppColor
                      : Colors.transparent,
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(categoryCubit.brandList[0].brands[index].fabricImage),
                radius: 25,
              ),
            ),
          );
        },
      ),
    );
  }
}

