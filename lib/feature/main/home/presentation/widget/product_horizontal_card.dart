import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../catagory/model/product_model.dart';
import '../../manager/cubit/home_cubit.dart';
import '../screens/order_again.dart';

class ProductHorizontalCard extends StatelessWidget {
  final     List<ProductModel> product;
  final String categoryName;
  const ProductHorizontalCard({super.key,  required this.product,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.45;
    final containerHeight = containerWidth * 1.2;
    final imageWidth = containerWidth * 0.5;
    final buttonHorizontalPadding = containerWidth * 0.12;
    const buttonVerticalPadding = 10.0;
    final fontSizePrice = screenWidth * 0.045;
    final fontSizeTitle = screenWidth * 0.022;
    final fontSizeButton = screenWidth * 0.028;
    final imageHeight = containerHeight * 0.4;
    final isArabic = context.locale.languageCode == 'ar';
    return
     (product.isNotEmpty)?

      Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  categoryName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Alexandria",
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainAppColor,
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Image.asset(AppAssets.line),
              SizedBox(width: 5.w),
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderAgain()));
                  },
                  child: Text(
                    "view_all".tr(),
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Alexandria",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff231F20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: containerHeight + 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: containerWidth,
                          height: containerHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey.shade300, blurRadius: 6),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: containerHeight * 0.16,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child:
                                  CachedNetworkImage(
                                    imageUrl: product[index].productImage.toString()??'',
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

                                  ),


                                ),
                              ),
                              if(product[index].discountPercent!>0)
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [

                                    Image.asset("assets/images/Vector 356.png"),

                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Center(
                                          child: Text(
                                            '${ '${product[index].discountPercent} '}%',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: fontSizePrice * 0.8,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "offers".tr(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: fontSizePrice * 0.7,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Positioned(
                                top: 0,
                                left: 0,
                                child:
                                Icon(Icons.favorite_border, color: Colors.grey),
                              ),
                              Positioned(
                                top: containerHeight * 0.5,
                                right: 12,
                                left: 12,
                                child: Text(
                                  '${product[index].price}',
                                  style: TextStyle(
                                    fontSize: fontSizePrice,
                                    color: AppColors.mainAppColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Alexandria",
                                  ),
                                ),
                              ),
                              Positioned(
                                top: containerHeight * 0.63,
                                right: 12,
                                left: 12,
                                child: Text(
                                  isArabic
                                      ? product[index].productArName ?? ''
                                      : product[index].productEnName ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Alexandria",
                                    fontSize: fontSizeTitle,
                                    color: const Color(0xff231F20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -15,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {


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
                        ),
                      ],
                    ),
                    //const SizedBox(width: 12),
                    // Stack(
                    //   clipBehavior: Clip.none,
                    //   children: [
                    //     Container(
                    //       width: containerWidth,
                    //       height: containerHeight,
                    //       margin: const EdgeInsets.all(8),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(12),
                    //         color: Colors.white,
                    //         boxShadow: [
                    //           BoxShadow(color: Colors.grey.shade300, blurRadius: 6),
                    //         ],
                    //       ),
                    //       child: Stack(
                    //         children: [
                    //           Positioned(
                    //             top: containerHeight * 0.16,
                    //             left: 0,
                    //             right: 0,
                    //             child: Center(
                    //               child: Image.asset(
                    //                 AppAssets.offer,
                    //                 width: imageWidth,
                    //               ),
                    //             ),
                    //           ),
                    //           const Positioned(
                    //             top: 0,
                    //             left: 0,
                    //             child:
                    //             Icon(Icons.favorite_border, color: Colors.grey),
                    //           ),
                    //           Positioned(
                    //             top: containerHeight * 0.5,
                    //             right: 12,
                    //             left: 12,
                    //             child: Text(
                    //               '${product[index].price}',
                    //               style: TextStyle(
                    //                 fontSize: fontSizePrice,
                    //                 color: AppColors.mainAppColor,
                    //                 fontWeight: FontWeight.w700,
                    //                 fontFamily: "Alexandria",
                    //               ),
                    //             ),
                    //           ),
                    //           Positioned(
                    //             top: containerHeight * 0.63,
                    //             right: 12,
                    //             left: 12,
                    //             child: Text(
                    //                 '${product[index].productArName}',
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.w500,
                    //                 fontFamily: "Alexandria",
                    //                 fontSize: fontSizeTitle,
                    //                 color: const Color(0xff231F20),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Positioned(
                    //       bottom: -7,
                    //       left: 0,
                    //       right: 0,
                    //       child: Center(
                    //         child: ElevatedButton(
                    //           onPressed: () {},
                    //           style: ElevatedButton.styleFrom(
                    //             backgroundColor: AppColors.mainAppColor,
                    //             shape: const StadiumBorder(),
                    //             padding: EdgeInsets.symmetric(
                    //               horizontal: buttonHorizontalPadding,
                    //               vertical: buttonVerticalPadding,
                    //             ),
                    //           ),
                    //           child: Text(
                    //             'add_to_cart'.tr(),
                    //             style: TextStyle(
                    //               fontFamily: "Alexandria",
                    //               fontSize: fontSizeButton,
                    //               fontWeight: FontWeight.w500,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ):const SizedBox();
  }
}
