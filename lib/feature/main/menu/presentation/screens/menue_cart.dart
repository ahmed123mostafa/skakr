import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/menu/manager/cart_cubit.dart';
import 'package:settings_app/feature/main/menu/manager/chat_state.dart';
import 'package:settings_app/feature/main/menu/presentation/screens/new_add_address.dart';
import 'package:settings_app/feature/main/payment/presentation/screens/choose_delivery_time.dart';

import '../../model/cart_item_model.dart';

class MenueCart extends StatefulWidget {
  const MenueCart({super.key});

  @override
  State<MenueCart> createState() => _MenueCartState();
}

class _MenueCartState extends State<MenueCart> {
  List<int> quantities = List.generate(5, (index) => 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  children: [
                    Image.asset(AppAssets.cart23),
                    SizedBox(width: 15.w),
                    Text(
                      "cart".tr(),
                      style: TextStyle(
                        fontFamily: "Alexandria",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainAppColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppColors.mainAppColor,
                        size: 30,
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return SingleChildScrollView(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        maxWidth:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.w),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'choose address'.tr(),
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .mainAppColor,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.h),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const NewAddAddress()));
                                                      },
                                                      child: Text(
                                                        'add new address'.tr(),
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .mainAppColor,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/Vector (27).png",
                                                    width: 25,
                                                    height: 25,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 5.h),
                                            Divider(
                                              color: AppColors.mainAppColor,
                                              height: 30.h,
                                            ),
                                            Text(
                                              'an address already exists'.tr(),
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff231F20),
                                              ),
                                            ),
                                            SizedBox(height: 10.h),
                                            Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: Border.all(
                                                      color: AppColors
                                                          .mainAppColor,
                                                    )),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "house".tr(),
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .mainAppColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12.sp,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: 10.w),
                                                            Text(
                                                              "(main_title)"
                                                                  .tr(),
                                                              style: TextStyle(
                                                                color: const Color(
                                                                    0xff231F20),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 6.sp,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Icon(
                                                          Icons
                                                              .check_circle_outline,
                                                          color: AppColors
                                                              .mainAppColor,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 8.h),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                            "assets/images/Layer_2_copy_11 (1).png"),
                                                        SizedBox(width: 5.w),
                                                        Text(
                                                          "mohamed samir".tr(),
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .mainAppColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 7.h),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                            "assets/images/Group (8).png"),
                                                        SizedBox(width: 5.w),
                                                        Text(
                                                          "01096397289",
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xff0A9223),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 7.h),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          color: AppColors
                                                              .mainAppColor,
                                                        ),
                                                        SizedBox(width: 5.w),
                                                        Expanded(
                                                          child: Text(
                                                            "mansoura_talkha_corner_of_agriculture_street_al-Maghazi_tower"
                                                                .tr(),
                                                            style: TextStyle(
                                                              color: const Color(
                                                                  0xff231F20),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12.sp,
                                                            ),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              'delivery_to:home'.tr(),
                              style: TextStyle(
                                color: AppColors.mainAppColor,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            'azzhar_street 2,hawalli,nasr city'.tr(),
                            style: TextStyle(
                              color: AppColors.mainAppColor,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.mainAppColor,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              BlocBuilder <CartCubit,CartState>(
                builder: (context,state) {
                  final cartCubit = context.read<CartCubit>();
                  final cartItems = cartCubit.cartItems;

                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartItems.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10.h),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12),
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                width: 70.w,
                                height: 84.h,
                                fit: BoxFit.cover,
                                placeholder:
                                    (context, url) => Padding(
                                  padding:
                                  const EdgeInsets.all(
                                    8.0,
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value: 1.0,
                                      color:
                                      AppColors
                                          .mainAppColor,
                                    ),
                                  ),
                                ),
                                errorWidget:
                                    (context, url, error) =>
                                const Icon(Icons.error),
                                imageUrl: cartItems[index].image,

                              ),

                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                cartItems[index].nameAr??'',
                                      style: TextStyle(
                                        color: const Color(0xff231F20),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        Text(
                                          "price:".tr(),
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: const Color(0xff231F20),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(

                                          '${cartItems[index].priceAfterDiscount.toStringAsFixed(2)} ${"pounds".tr()}'
                                           ,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.mainAppColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "total:".tr(),
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: const Color(0xff231F20),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        BlocBuilder<CartCubit,CartState>(
                                          builder: (context,state) {
                                            final cartCubit = context.read<CartCubit>();

                                            final itemCount = cartCubit.getItemCount(
                                              productId: cartItems[index].productId,
                                              nameAr: cartItems[index].nameAr,
                                              nameEn: cartItems[index].nameEn,
                                              customerQuantity: cartItems[index].customerQuantity,
                                              stockQuantity: cartItems[index].stockQuantity,
                                              barcode: cartItems[index].barcode,
                                              image: cartItems[index].image,
                                              price: cartItems[index].priceBeforeDiscount,
                                              priceAfterDiscount: cartItems[index].priceAfterDiscount,
                                            );
                                            return Text( '${(itemCount*cartItems[index].priceAfterDiscount).toStringAsFixed(2)} ${"pounds".tr()}'??'' ,
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.mainAppColor,
                                              ),
                                            );
                                          }
                                        ),
                                        const Spacer(),
                                        BlocBuilder<CartCubit, CartState>(
                                          builder: (context, state) {
                                            final cartCubit = context.read<CartCubit>();

                                            final itemCount = cartCubit.getItemCount(
                                              productId: cartItems[index].productId,
                                              nameAr: cartItems[index].nameAr,
                                              nameEn: cartItems[index].nameEn,
                                              customerQuantity: cartItems[index].customerQuantity,
                                              stockQuantity: cartItems[index].stockQuantity,
                                              barcode: cartItems[index].barcode,
                                              image: cartItems[index].image,
                                              price: cartItems[index].priceBeforeDiscount,
                                              priceAfterDiscount: cartItems[index].priceAfterDiscount,
                                            );

                                            return Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    if (itemCount > 1) {
                                                      cartCubit.removeItem(cartItems[index].barcode);
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
                                                    if (
                                                    (cartItems[index].stockQuantity > 0 && cartItems[index].customerQuantity <= 0 && itemCount < cartItems[index].stockQuantity) ||
                                                        (cartItems[index].customerQuantity > 0 && itemCount < cartItems[index].customerQuantity) ||
                                                        (cartItems[index].stockQuantity <= 0 && cartItems[index].customerQuantity > 0 && itemCount < cartItems[index].customerQuantity) ||
                                                        (cartItems[index].stockQuantity <= 0 && itemCount < cartItems[index].customerQuantity) ||
                                                        (cartItems[index].customerQuantity == 0)
                                                    ) {
                                                      cartCubit.addItem(
                                                        CartItem(
                                                          productId: cartItems[index].productId,
                                                          nameAr: cartItems[index].nameAr,
                                                          nameEn: cartItems[index].nameEn,
                                                          barcode: cartItems[index].barcode,
                                                          priceBeforeDiscount: cartItems[index].priceBeforeDiscount,
                                                          priceAfterDiscount: cartItems[index].priceAfterDiscount,
                                                          image: cartItems[index].image,
                                                          stockQuantity: cartItems[index].stockQuantity,
                                                          customerQuantity: cartItems[index].customerQuantity,
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
                                            );
                                          },
                                        )

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
              SizedBox(height: 30.h),
              const OrderMinimumWidget(),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<CartCubit,CartState>(
                              builder: (context,state) {
                                final cartCubit = context.read<CartCubit>();
                              return Text(
                                '${cartCubit.calculateTotalPrice().toStringAsFixed(2)} ${"pounds".tr()}',
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    color: AppColors.mainAppColor,
                                    fontWeight: FontWeight.w600),
                              );
                            }
                          ),
                          Text(
                            'subtotal'.tr(),
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.mainAppColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 138,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                       DeliveryTimeScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainAppColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'payment'.tr(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.backgroundAppColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderMinimumWidget extends StatelessWidget {
  const OrderMinimumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 233.w,
        height: 125.h,
        padding: const EdgeInsets.only(right: 8, left: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.mainAppColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 5, top: 10, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    "the_minimum_order".tr(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.mainAppColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "2000 pounds".tr(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.mainAppColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "total".tr(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.mainAppColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  BlocBuilder<CartCubit,CartState>(
                    builder: (context,state) {
                      final cartCubit = context.read<CartCubit>();
                      return Text(
                        '${cartCubit.calculateTotalPrice().toStringAsFixed(2)} ${"pounds".tr()}',

                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.mainAppColor,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    }
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                "less than the minimum required to complete the purchase. Remaining to complete the purchase is 1700 pounds."
                    .tr(),
                style: TextStyle(
                  fontSize: 9.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
