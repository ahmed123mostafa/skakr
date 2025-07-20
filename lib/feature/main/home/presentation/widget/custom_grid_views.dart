import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/details/presentation/screens/details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../catagory/manager/category_cubit.dart';
import '../../../menu/manager/cart_cubit.dart';
import '../../../menu/manager/chat_state.dart';
import '../../../menu/model/cart_item_model.dart';

class Customgridview extends StatelessWidget {
  Customgridview({super.key,required this.categoryCubit});
  CategoryCubit? categoryCubit;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final containerWidth = screenWidth * 0.45;
    final containerHeight = containerWidth * 1.2;
    final imageHeight = containerHeight * 0.4;
    final imageWidth = containerWidth * 0.5;
    final buttonHorizontalPadding = containerWidth * 0.12;
    const buttonVerticalPadding = 10.0;
    final fontSizeButton = screenWidth * 0.028;
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoryCubit?.itemsSubCategoryList.length??0,
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
                            builder: (context) => DetailsScreen(productId:categoryCubit!.itemsSubCategoryList[index].productId ,),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: InkWell(
                          onTap: (){
                            print(categoryCubit!.itemsSubCategoryList[index].productImage);
                          },
                          child:
          CachedNetworkImage(
          imageUrl:  categoryCubit!.itemsSubCategoryList[index].productImage.toString(),
          placeholder: (context, url) => Skeletonizer(
          enabled: true,
          child: Center(
          child: Icon(Icons.image, size:  imageWidth,
          weight:imageWidth ,



          ),
          ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: imageWidth,
          height: imageHeight,

          )


                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Text(
                        '${categoryCubit?.itemsSubCategoryList[index].price??0}',
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

                        categoryCubit?.itemsSubCategoryList[index].productArName??'',
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
                  final productItem = categoryCubit?.itemsSubCategoryList[index];

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
                              if (itemCount > 1) {
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
                              final canAdd = (
                                  (productItem.stockQuantity > 0 &&
                                      productItem.stockQuantity <= 0 &&
                                      itemCount < productItem.stockQuantity) ||
                                      ( productItem.stockQuantity > 0 &&
                                          itemCount <  productItem.stockQuantity) ||
                                      (productItem.stockQuantity <= 0 &&
                                          productItem.stockQuantity > 0 &&
                                          itemCount <  productItem.stockQuantity) ||
                                      (productItem.stockQuantity <= 0 &&
                                          itemCount <  productItem.stockQuantity) ||
                                      ( productItem.stockQuantity == 0)
                              );

                              if (canAdd) {
                                cartCubit.addItem(
                                  CartItem(
                                    productId: productItem.productId,
                                    nameAr: productItem.productArName,
                                    nameEn: productItem.productEnName,
                                    barcode: productItem.barCode,
                                    priceBeforeDiscount: productItem.priceAfterDiscount,
                                    priceAfterDiscount: productItem.priceAfterDiscount,
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
                          cartCubit.addItem(
                            CartItem(
                              productId: productItem.productId,
                              nameAr: productItem.productArName,
                              nameEn: productItem.productEnName,
                              barcode: productItem.barCode,
                              priceBeforeDiscount: productItem.priceAfterDiscount,
                              priceAfterDiscount: productItem.priceAfterDiscount,
                              image: productItem.productImage ?? '',
                              stockQuantity: productItem.stockQuantity,
                              customerQuantity: productItem.stockQuantity,
                              quantity: productItem.stockQuantity.toInt(),
                            ),
                          );
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
              )
            ],
          );
        },
      ),
    );
  }
}
