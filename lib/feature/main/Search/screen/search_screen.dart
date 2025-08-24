import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/feature/main/Search/screen/search_field_widget.dart';
import 'package:settings_app/feature/main/catagory/model/product_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constant/app_colors.dart';
import '../../favourite/model/favorite_model.dart';
import '../../favourite/presentation/screens/favourite_screen.dart';
import '../../favourite/presentation/widget/favourite_item.dart';
import '../manager/search_cubit.dart';
import '../manager/search_state.dart';
class SearchScreen extends StatelessWidget {
   SearchScreen({super.key,required this.searchCubit});
  SearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    //currentLang = CacheHelper.getData(key: 'changeLang')??'ar';
    final screenWidth = MediaQuery.of(context).size.width;
   // final currentLocale = context.locale;
    return Scaffold(
        backgroundColor: AppColors.backgroundAppColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundAppColor,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 0),
            child:   SearchFieldWidget(inSearch: false,),
          ),

        ),

        body:
        BlocBuilder<SearchCubit, SearchState>(
          bloc:searchCubit ,
          builder: (context, state) {

            if (state is SearchLoading) {
              return  Center(
                child: CircularProgressIndicator(color: AppColors.mainAppColor,)
                // Lottie.asset(
                //   AppAssets.loading,
                //   width: 200.0,
                //   height: 200.0,
                //   fit: BoxFit.fill,
                // ),
              );
            }


            if (state is SearchSuccess) {
              final searchProduct = searchCubit;

              return  BlocBuilder<SearchCubit,SearchState>(



                  builder: (context,state) {
                    SearchCubit searchCubit = context.read<SearchCubit>();
                    return Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child:
                        ConditionalBuilder
                          (condition: state is SearchSuccess,
                            builder: (context,)
                            {
                              return ListView.builder(
                                itemCount:searchCubit.searchList.length,
                                itemBuilder: (context, index) {
                                  ProductModel product = searchCubit.searchList[index];
                                  return   CustomCard(
                                    productID: product.productId,
                                    productName: product.productArName,
                                    productEnName: product.productEnName,
                                    barCode: product.barCode,
                                    productImage: product.productImage!,
                                    price: product.price,
                                    priceAfterDiscount: product.priceAfterDiscount,
                                    stockQuantity: product.stockQuantity,
                                  );

                                }





                              );

                            },
                            fallback: (context)
                            {
                              return Skeletonizer(
                                enabled: true,
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) =>


                                  const CustomCard(
                                    productID: 5,
                                    productName: 'product.productName!',
                                    productEnName: 'product.productEnName!',
                                    barCode: '4',
                                    productImage:  "https://example.com/image2.png",
                                    price: 2,
                                    priceAfterDiscount: 25,
                                    stockQuantity: 2,
                                  )
                                ),
                              );
                            }

                        ));



                  }
              );



            }

            if (state is SearchError) {
              return Center(
                  child:
                  Column(
                    children: [
                      Text('حدث خطاء ')
                    ],
                  )

                // SvgPicture.asset(
                //   AppAssets.notFound,
                //   width: 200.0,
                //   height: 200.0,
                //   fit: BoxFit.contain,  // Set fit type (optional)
                // ),
              );
            }

            return Center(
              child:
                Column(
                  children: [
                    Text('ابخث عن منتجك ')
                  ],
                )

              // SvgPicture.asset(
              //   AppAssets.notFound,
              //   width: 200.0,
              //   height: 200.0,
              //   fit: BoxFit.contain,  // Set fit type (optional)
              // ),
            );
          },
        )







    );
  } }

