import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

import 'package:settings_app/core/constant/custom_text_field.dart';
import 'package:settings_app/feature/main/Search/manager/search_cubit.dart';
import 'package:settings_app/feature/main/Search/manager/search_state.dart';
import 'package:settings_app/feature/main/Search/screen/search_field_widget.dart';
import 'package:settings_app/feature/main/Search/screen/search_screen.dart';
import 'package:settings_app/feature/main/home/presentation/screens/order_again.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_carsoudal_slider_two.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_caesoudal_slidar.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_grid_view.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_marque.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_product_cart.dart';
import 'package:settings_app/feature/main/list/saved_address/manager/saved_address_state.dart';
import 'package:settings_app/feature/main/list/saved_address/manager/saved_sddress_cubit.dart';

import '../../../catagory/model/product_model.dart';
import '../../../menu/manager/cart_cubit.dart';
import '../../../menu/manager/chat_state.dart';
import '../../manager/cubit/home_cubit.dart';
import '../../model/offer_model.dart';
import '../widget/product_horizontal_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        width: 107,

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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocBuilder<SavedAddressCubit,SavedAddressState>(
                                builder: (context,state) {
                                  return ConditionalBuilder(
                                    condition: BlocProvider.of<SavedAddressCubit>(context).allAddressList.isNotEmpty,
                                    builder: (context) {
                                      final address = BlocProvider.of<SavedAddressCubit>(context).allAddressList[context.read<SavedAddressCubit>().selectAddress];

                                      return Text(
                                        '${ address.address ?? ""} - ${address.addressNotes ?? ""}',
                                        style: TextStyle(
                                          fontFamily: "Alexandria",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff231F20),
                                        ),
                                      );
                                    },
                                    fallback: (context) => Text(
                                      " ",
                                      style: TextStyle(
                                        fontFamily: "Alexandria",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff231F20),
                                      ),
                                      ),

                                  );
                                }
                            ),

                            Text(
                              "address".tr(),
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xff231F20),
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
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocBuilder<CartCubit, CartState>(
                              builder: (context, state) {
                                final cubit= context.watch<CartCubit>();
                                return

                                  Text(
                                    '${cubit.cartItems.isNotEmpty ?cubit.cartItems.length: 0}',
                                    style: TextStyle(
                                      fontFamily: "Alexandria",
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.mainAppColor,
                                    ),
                                  );

                              },
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
              SearchFieldWidget(inSearch:true,),
              const CustomCaesoudalSlidar(),
              const CustomMarque(),
              const SizedBox(
                height: 5,
              ),
               const ContentGrid(),
              const CarsodalSliderTwo(),
              SizedBox(
                height: 20.h,
              ),



              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
                  return

                    InkWell(onTap: (){

                      cubit.getBiggestDiscountProducts();

                  },child: ProductHorizontalCard(categoryName:  "best_sellers".tr() ,product:cubit.bestSellerList ,itemsFavorite: cubit.itemsBestSellerFavorite,));
                },
              ),

              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
                  return

                    InkWell(onTap: (){

                      cubit.getBiggestDiscountProducts();


                    },child: ProductHorizontalCard(categoryName: "most_discount".tr(),product:cubit.biggestDiscountList ,itemsFavorite: cubit.itemsBiggestDiscountFavorite,));
                },
              ),



              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
                  return   InkWell(onTap: (){


                    cubit.getOfferOne();


                  },child: ProductHorizontalCard(categoryName: "new_arrivals".tr() ,product:cubit.newProductList ,itemsFavorite: cubit.itemsNewProductFavorite,));

                },
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = context.read<HomeCubit>();


                  final visibleOffers = cubit.offerOneList
                      .where((offer) => offer.showOffer)
                      .toList();

                  return InkWell(
                    onTap: (){
                      cubit.getOfferOne();
                    },
                    child: ListView.builder(
                      itemCount: visibleOffers.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final offer = visibleOffers[index];

                        // تحويل OfferItem → ProductModel
                        final products = offer.offerItems
                            .map((item) => item.toProductModel())
                            .toList();

                        return ProductHorizontalCard(
                          categoryName: offer.offerName,
                          product: products,
                          itemsFavorite: cubit.itemsOfferOneFavorite,
                        );
                      },
                    ),
                  );
                },
              ),

              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = context.read<HomeCubit>();


                  final visibleOffers = cubit.offerTwoList
                      .where((offer) => offer.showOffer)
                      .toList();

                  return ListView.builder(
                    itemCount: visibleOffers.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final offer = visibleOffers[index];

                      // تحويل OfferItem → ProductModel
                      final products = offer.offerItems
                          .map((item) => item.toProductModel())
                          .toList();

                      return ProductHorizontalCard(
                        categoryName: offer.offerName,
                        product: products,
                        itemsFavorite: cubit.itemsOfferTwoFavorite,
                      );
                    },
                  );
                },
              ),



              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = context.read<HomeCubit>();

                  // تصفية العروض اللي showOffer = true فقط
                  final visibleOffers = cubit.offerThreeList
                      .where((offer) => offer.showOffer)
                      .toList();

                  return ListView.builder(
                    itemCount: visibleOffers.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final offer = visibleOffers[index];

                      // تحويل OfferItem → ProductModel
                      final products = offer.offerItems
                          .map((item) => item.toProductModel())
                          .toList();

                      return ProductHorizontalCard(
                        categoryName: offer.offerName,
                        product: products,
                        itemsFavorite: cubit.itemsOfferThreeFavorite,
                      );
                    },
                  );
                },
              ),



              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = context.read<HomeCubit>();

                  // تصفية العروض اللي showOffer = true فقط
                  final visibleOffers = cubit.offerFourList
                      .where((offer) => offer.showOffer)
                      .toList();

                  return ListView.builder(
                    itemCount: visibleOffers.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final offer = visibleOffers[index];

                      // تحويل OfferItem → ProductModel
                      final products = offer.offerItems
                          .map((item) => item.toProductModel())
                          .toList();

                      return ProductHorizontalCard(
                        categoryName: offer.offerName,
                        product: products,
                        itemsFavorite: cubit.itemsOfferFourFavorite,
                      );
                    },
                  );
                },
              ),



              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = context.read<HomeCubit>();


                  final visibleOffers = cubit.offerFiveList
                      .where((offer) => offer.showOffer)
                      .toList();

                  return ListView.builder(
                    itemCount: visibleOffers.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final offer = visibleOffers[index];

                      // تحويل OfferItem → ProductModel
                      final products = offer.offerItems
                          .map((item) => item.toProductModel())
                          .toList();

                      return ProductHorizontalCard(
                        categoryName: offer.offerName,
                        product: products,
                        itemsFavorite: cubit.itemsOfferFiveFavorite,
                      );
                    },
                  );
                },
              ),






            ],
          ),
        ),
      ),
    );
  }
}
