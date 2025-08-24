import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/favourite/manager/favorite_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../menu/manager/cart_cubit.dart';
import '../../../menu/manager/chat_state.dart';
import '../../../menu/model/cart_item_model.dart';
import '../../model/favorite_model.dart';

// class FavouriteItem extends StatelessWidget {
//
//   FavoriteModel item;
// FavouriteItem({
//     super.key,
// required this.item
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final locale = context.locale;
//
//     return Card(
//       color: AppColors.backgroundAppColor,
//       margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.03),
//         child: Row(
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: CachedNetworkImage(
//                     imageUrl: item.productImage!,
//                     width: screenWidth * 0.22,
//                     height: screenHeight * 0.12,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => const Skeletonizer(
//                       enabled: true,
//                       child: Center(
//                         child: Icon(Icons.image, size:  52,
//
//
//
//
//                         ),
//                       ),
//                     ),
//                     errorWidget: (context, url, error) => const Icon(Icons.error),
//                   ),
//                 ),
//                 BlocBuilder<CartCubit, CartState>(
//                   builder: (context, state) {
//                     final cartCubit = context.read<CartCubit>();
//                     final productItem = item;
//
//
//                     final itemCount = cartCubit.getItemCount(
//                       productId: productItem.productID!.toInt(),
//                       nameAr: productItem.productName!,
//                       nameEn: productItem.productEnName!,
//                       customerQuantity: productItem.stockQuantity!,
//                       stockQuantity: productItem.stockQuantity!,
//                       barcode: productItem.barCode!,
//                       image: productItem.productImage ?? '',
//                       price: productItem.priceAfterDiscount!.toDouble(),
//                       priceAfterDiscount: productItem.priceAfterDiscount!.toDouble(),
//                     );
//
//                     final isInCart = itemCount > 0;
//
//                     return Positioned(
//                       bottom: 2,
//                       right: 4,
//                       child: isInCart
//                           ? Container(
//                         decoration: BoxDecoration(
//                           color: AppColors.mainAppColor,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.015,
//                         ),
//                         child: Row(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 if (itemCount > 1) {
//                                   cartCubit.removeItem(productItem.barCode.toString());
//                                 } else {
//
//                                   cartCubit.removeItem(productItem.barCode.toString());
//                                 }
//                               },
//                               child: Icon(
//                                 Icons.remove,
//                                 size: screenWidth * 0.045,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: screenWidth * 0.015,
//                               ),
//                               child: Text(
//                                 '$itemCount',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: screenWidth * 0.035,
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//
//                                 if (itemCount < productItem.stockQuantity!) {
//                                   cartCubit.addItem(
//                                     CartItem(
//                                       productId: productItem.productID!,
//                                       nameAr: productItem.productName!,
//                                       nameEn: productItem.productEnName!,
//                                       barcode: productItem.barCode!,
//                                       priceBeforeDiscount:
//                                       productItem.priceAfterDiscount!.toDouble(),
//                                       Price: productItem.priceAfterDiscount!.toDouble(),
//                                       image: productItem.productImage ?? '',
//                                       stockQuantity: productItem.stockQuantity!,
//                                       customerQuantity: productItem.stockQuantity!,
//                                       quantity: 1,
//                                     ),
//                                   );
//                                 }
//                               },
//                               child: Icon(
//                                 Icons.add,
//                                 size: screenWidth * 0.045,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                           : GestureDetector(
//                         onTap: () {
//
//                           if (itemCount < productItem.stockQuantity!) {
//                             cartCubit.addItem(
//                               CartItem(
//                                 productId: productItem.productID!,
//                                 nameAr: productItem.productName!,
//                                 nameEn: productItem.productEnName!,
//                                 barcode: productItem.barCode!,
//                                 priceBeforeDiscount:
//                                 productItem.priceAfterDiscount!.toDouble(),
//                                 Price: productItem.priceAfterDiscount!.toDouble(),
//                                 image: productItem.productImage ?? '',
//                                 stockQuantity: productItem.stockQuantity!,
//                                 customerQuantity: productItem.stockQuantity!,
//                                 quantity: 1,
//                               ),
//                             );
//                           }
//
//                         },
//                         child: CircleAvatar(
//                           radius: screenWidth * 0.045,
//                           backgroundColor: AppColors.mainAppColor,
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.white,
//                             size: screenWidth * 0.05,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 )
//               ],
//             ),
//             SizedBox(width: screenWidth * 0.03),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                    item.productName.toString(),
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: screenWidth * 0.030,
//                       color: const Color(0xff231F20),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.005),
//                   Text(
//     '${item.price!.toStringAsFixed(2)} ${"pounds".tr()}',
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.06,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.mainAppColor,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.01),
//                   Align(
//                     alignment: locale == const Locale('ar')
//                         ? Alignment.bottomLeft
//                         : Alignment.bottomRight,
//                     child: ElevatedButton(
//                       onPressed: (){
//
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.mainAppColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.05,
//                           vertical: screenHeight * 0.005,
//                         ),
//                       ),
//                       child: Text(
//                         'view_details'.tr(),
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.035,
//                           color: AppColors.backgroundAppColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class CustomCard extends StatelessWidget {
  final int productID;
  final String productName;
  final String productEnName;
  final String barCode;
  final String productImage;
  final num price;
  final num priceAfterDiscount;
  final num stockQuantity;

  const CustomCard({
    super.key,
    required this.productID,
    required this.productName,
    required this.productEnName,
    required this.barCode,
    required this.productImage,
    required this.price,
    required this.priceAfterDiscount,
    required this.stockQuantity,
  });

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
                  child: CachedNetworkImage(
                    imageUrl: productImage,
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.12,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                    const Center(child: Icon(Icons.image, size: 52)),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    final cartCubit = context.read<CartCubit>();

                    final itemCount = cartCubit.getItemCount(
                      productId: productID,
                      nameAr: productName,
                      nameEn: productEnName,
                      customerQuantity: stockQuantity,
                      stockQuantity: stockQuantity,
                      barcode: barCode,
                      image: productImage,
                      price: priceAfterDiscount.toDouble(),
                      priceAfterDiscount: priceAfterDiscount.toDouble(),
                    );

                    final isInCart = itemCount > 0;

                    return Positioned(
                      bottom: 2,
                      right: 4,
                      child: isInCart
                          ? Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainAppColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.015),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                cartCubit.removeItem(barCode);
                              },
                              child: Icon(
                                Icons.remove,
                                size: screenWidth * 0.045,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.015),
                              child: Text(
                                '$itemCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (itemCount < stockQuantity) {
                                  cartCubit.addItem(
                                    CartItem(
                                      productId: productID,
                                      nameAr: productName,
                                      nameEn: productEnName,
                                      barcode: barCode,
                                      priceBeforeDiscount:
                                      priceAfterDiscount.toDouble(),
                                      Price:
                                      priceAfterDiscount.toDouble(),
                                      image: productImage,
                                      stockQuantity: stockQuantity,
                                      customerQuantity: stockQuantity,
                                      quantity: 1,
                                    ),
                                  );
                                }
                              },
                              child: Icon(
                                Icons.add,
                                size: screenWidth * 0.045,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                          : GestureDetector(
                        onTap: () {
                          if (itemCount < stockQuantity) {
                            cartCubit.addItem(
                              CartItem(
                                productId: productID,
                                nameAr: productName,
                                nameEn: productEnName,
                                barcode: barCode,
                                priceBeforeDiscount:
                                priceAfterDiscount.toDouble(),
                                Price: priceAfterDiscount.toDouble(),
                                image: productImage,
                                stockQuantity: stockQuantity,
                                customerQuantity: stockQuantity,
                                quantity: 1,
                              ),
                            );
                          }
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
                    );
                  },
                )
              ],
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.030,
                      color: const Color(0xff231F20),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    '${price.toStringAsFixed(2)} ${"pounds".tr()}',
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainAppColor,
                    ),
                  ),
                  Align(
                    alignment: locale == const Locale('ar')
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: (){

                      },
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


