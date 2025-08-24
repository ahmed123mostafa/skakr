import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../details/presentation/screens/details_screen.dart';
import '../../../favourite/manager/favorite_cubit.dart';
import '../../../favourite/manager/favorite_state.dart';
import '../../../menu/manager/cart_cubit.dart';
import '../../../menu/manager/chat_state.dart';
import '../../../menu/model/cart_item_model.dart';
import '../widget/custom_grid_views.dart';

class ItemsCategoryOffer extends StatelessWidget {
  final String categoryName;

  List product;
  final dynamic isFavoriteMap;
  ItemsCategoryOffer({super.key,required this.isFavoriteMap,required this.product,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final containerWidth = screenWidth * 0.45;
    final containerHeight = containerWidth * 1.5;
    final imageHeight = containerHeight * 0.4;
    final imageWidth = containerWidth * 0.5;
    final buttonHorizontalPadding = containerWidth * 0.12;
    const buttonVerticalPadding = 10.0;
    final fontSizeButton = screenWidth * 0.028;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AppColors.mainAppColor,
        title:  Text(
          categoryName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,


      ) ,

      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: GridView.builder(
          physics: const ScrollPhysics(),
          itemCount: product.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: screenWidth * 0.02,
            mainAxisSpacing: screenHeight * 0.025,
            childAspectRatio: containerWidth / containerHeight,
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
                              builder: (context) => DetailsScreen(productId:product[index].productId ,),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: CachedNetworkImage(
                            imageUrl:  product[index].productImage.toString(),
                            placeholder: (context, url) => Skeletonizer(
                              enabled: true,
                              child: Center(
                                child: Icon(Icons.image, size:  100,
                                  weight:imageWidth ,



                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            width: imageWidth,
                            height: imageHeight,

                          ),
                        ),
                      ),

                      Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),

                          child:
                          product[index].discountPercent! > 0
                              ? Row(
                            children: [
                              Text(
                                '${product[index].price.toStringAsFixed(2)} ${"pounds".tr()}',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Alexandria",
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${product[index].priceAfterDiscount.toStringAsFixed(2)} ${"pounds".tr()}',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  color: AppColors.mainAppColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Alexandria",
                                ),
                              ),
                            ],
                          )
                              : Text(
                            '${product[index].price.toStringAsFixed(2) ?? 0} ${"pounds".tr()}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              color: AppColors.mainAppColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Alexandria",
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.03,
                            vertical: screenHeight * 0.005),
                        child: Text(

                          product[index].productArName??'',
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
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    final cartCubit = context.read<CartCubit>();
                    final productItem = product[index];

                    final itemCount = cartCubit.getItemCount(
                      productId: productItem!.productId,
                      nameAr: productItem.productArName,
                      nameEn: productItem.productEnName,
                      customerQuantity: productItem.stockQuantity,
                      stockQuantity: productItem.stockQuantity,
                      barcode: productItem.barCode,
                      image: productItem.productImage ?? '',
                      price: productItem.priceAfterDiscount,
                      priceAfterDiscount: productItem.priceAfterDiscount,
                    );

                    final isInCart = itemCount > 0;

                    return Positioned(
                      bottom:isInCart?0: -15,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: isInCart
                            ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (itemCount > 0) {
                                  cartCubit.removeItem(productItem.barCode);
                                }
                              },
                              icon: CircleAvatar(
                                radius: 13.r,
                                backgroundColor: AppColors.mainAppColor,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            Text(
                              '$itemCount',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                final canAdd = itemCount < productItem.stockQuantity;

                                if (canAdd) {
                                  cartCubit.addItem(
                                    CartItem(
                                      productId: productItem.productId,
                                      nameAr: productItem.productArName,
                                      nameEn: productItem.productEnName,
                                      barcode: productItem.barCode,
                                      priceBeforeDiscount: productItem.priceAfterDiscount,
                                      Price: productItem.priceAfterDiscount,
                                      image: productItem.productImage ?? '',
                                      stockQuantity: productItem.stockQuantity,
                                      customerQuantity: productItem.stockQuantity,
                                      quantity: 1,
                                    ),
                                  );
                                }
                              },
                              icon: CircleAvatar(
                                radius: 13.r,
                                backgroundColor: AppColors.mainAppColor,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ],
                        )
                            : ElevatedButton(
                          onPressed: () {
                            final canAdd = itemCount < productItem.stockQuantity;
                            if (canAdd) {
                              cartCubit.addItem(
                                CartItem(
                                  productId: productItem.productId,
                                  nameAr: productItem.productArName,
                                  nameEn: productItem.productEnName,
                                  barcode: productItem.barCode,
                                  priceBeforeDiscount: productItem.priceAfterDiscount,
                                  Price: productItem.priceAfterDiscount,
                                  image: productItem.productImage ?? '',
                                  stockQuantity: productItem.stockQuantity,
                                  customerQuantity: productItem.stockQuantity,
                                  quantity: productItem.stockQuantity.toInt(),
                                ),
                              );
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainAppColor,
                            shape: const StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                              horizontal: buttonHorizontalPadding,
                              vertical: buttonVerticalPadding,
                            ),
                          ),
                          child: Text(
                            'add_to_cart'.tr(),
                            style: TextStyle(
                              fontFamily: "Alexandria",
                              fontSize: fontSizeButton,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                BlocBuilder<FavoriteCubit,FavoriteState>(
                  builder: (context,state)
                  {
                    return Positioned(
                      top:5,
                      left: 5,
                      child: IconButton(
                        icon: Icon(
                          isFavoriteMap[product[index].barCode] ?? false
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:isFavoriteMap[product[index].barCode] ?? false
                              ? Colors.red
                              : Colors.grey,
                        ),

                        onPressed: (){
                          BlocProvider.of<FavoriteCubit>(
                              context)
                              .addFavorite(
                            barcode:product[index].barCode ,
                            favorite: isFavoriteMap
                            ,
                            productId: product[index].productId,
                          );

                        },  ),
                    );
                  },

                ),
                if(( product[index].discountPercent??0.0)>0)
                  Positioned(
                    top: 0,
                    right: 00,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [

                        Image.asset("assets/images/Vector 356.png"),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Text(
                                '${ '${ product[index].discountPercent} '}%',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "offers".tr(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize:10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
