import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/favourite/manager/favorite_cubit.dart';
import 'package:settings_app/feature/main/favourite/manager/favorite_state.dart';
import 'package:settings_app/feature/main/favourite/presentation/widget/favourite_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../model/favorite_model.dart';
import 'favourite_screen.dart';

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
          leading: IconButton(
            onPressed: (){
              //Navigator.pop(context);
            },
            icon: Icon( Icons.arrow_back,
              color: AppColors.mainAppColor,),

          ),
        ),
        body:

        BlocProvider(
          create: (context)=>FavoriteCubit()..getFavorite(),
          child: BlocBuilder<FavoriteCubit,FavoriteState>(



            builder: (context,state) {
              FavoriteCubit favoriteCubit = context.read<FavoriteCubit>();
              return Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child:
                  ConditionalBuilder
                    (condition: state is GetFavoriteSuccess,
                      builder: (context,)
              {
                return   (favoriteCubit.favoriteList.isEmpty)?
                const FavouriteScreen():
              ListView.builder(
              itemCount: favoriteCubit.favoriteList.length,
              itemBuilder: (context, index) {
                // FavouriteItem(item: favoriteCubit.favoriteList[index],),


                FavoriteModel product=favoriteCubit.favoriteList[index];
                return  CustomCard(
                  productID: product.productID!,
                  productName: product.productName!,
                  productEnName: product.productEnName!,
                  barCode: product.barCode!,
                  productImage: product.productImage!,
                  price: product.price!,
                  priceAfterDiscount: product.priceAfterDiscount!,
                  stockQuantity: product.stockQuantity!,
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
          ),
        ),
      ),
    );
  }
}
