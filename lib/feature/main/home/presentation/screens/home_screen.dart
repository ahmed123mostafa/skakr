import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

import 'package:settings_app/core/constant/custom_text_field.dart';
import 'package:settings_app/feature/main/home/presentation/screens/order_again.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_carsoudal_slider_two.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_caesoudal_slidar.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_grid_view.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_marque.dart';
import 'package:settings_app/feature/main/home/presentation/widget/custom_product_cart.dart';

import '../../../menu/manager/cart_cubit.dart';
import '../../../menu/manager/chat_state.dart';
import '../../manager/cubit/home_cubit.dart';
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "egypt".tr(),
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff231F20),
                              ),
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomTextFormField(
                  fillColor: Colors.white,
                  prefix: const Icon(Icons.search),
                  hintText: "type_here_the_one_you_want_to_search_for".tr(),
                ),
              ),
              const CustomCaesoudalSlidar(),
              const CustomMarque(),
              SizedBox(
                height: 15.h,
              ),
               const ContentGrid(),
              const CarsodalSliderTwo(),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "order_again".tr(),
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
                        onTap: () {
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
              const ProductCard(),
              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Text(
              //           "best_sellers".tr(),
              //           overflow: TextOverflow.ellipsis,
              //           style: TextStyle(
              //             fontFamily: "Alexandria",
              //             fontSize: 9.sp,
              //             fontWeight: FontWeight.w600,
              //             color: AppColors.mainAppColor,
              //           ),
              //         ),
              //       ),
              //       SizedBox(width: 3.w),
              //       Image.asset(AppAssets.line),
              //       SizedBox(width: 5.w),
              //       Expanded(
              //         child: InkWell(
              //           onTap: (){
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const OrderAgain()));
              //           },
              //           child: Text(
              //             "view_all".tr(),
              //             textAlign: TextAlign.end,
              //             overflow: TextOverflow.ellipsis,
              //             style: TextStyle(
              //               fontFamily: "Alexandria",
              //               fontSize: 12.sp,
              //               fontWeight: FontWeight.w600,
              //               color: const Color(0xff231F20),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
                  return ProductHorizontalCard(categoryName:  "best_sellers".tr() ,product:cubit.bestSellerList ,);
                },
              ),
            //  const BestSellerCart(),
            //   Padding(
            //     padding: const EdgeInsets.all(8),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: Text(
            //             "most_discount".tr(),
            //             overflow: TextOverflow.ellipsis,
            //             style: TextStyle(
            //               fontFamily: "Alexandria",
            //               fontSize: 9.sp,
            //               fontWeight: FontWeight.w600,
            //               color: AppColors.mainAppColor,
            //             ),
            //           ),
            //         ),
            //         SizedBox(width: 3.w),
            //         Image.asset(AppAssets.line),
            //         SizedBox(width: 5.w),
            //         Expanded(
            //           child: InkWell(
            //             onTap: (){
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => const OrderAgain()));
            //             },
            //             child: Text(
            //               "view_all".tr(),
            //               textAlign: TextAlign.end,
            //               overflow: TextOverflow.ellipsis,
            //               style: TextStyle(
            //                 fontFamily: "Alexandria",
            //                 fontSize: 12.sp,
            //                 fontWeight: FontWeight.w600,
            //                 color: const Color(0xff231F20),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
                  return

                    ProductHorizontalCard(categoryName: "most_discount".tr(),product:cubit.biggestDiscountList ,);
                },
              ),


              //const MostDiscountcart(),
              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Text(
              //           "new_arrivals".tr(),
              //           overflow: TextOverflow.ellipsis,
              //           style: TextStyle(
              //             fontFamily: "Alexandria",
              //             fontSize: 9.sp,
              //             fontWeight: FontWeight.w600,
              //             color: AppColors.mainAppColor,
              //           ),
              //         ),
              //       ),
              //       SizedBox(width: 3.w),
              //       Image.asset(AppAssets.line),
              //       SizedBox(width: 5.w),
              //       Expanded(
              //         child: InkWell(
              //           onTap: (){
              //            Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const OrderAgain()));
              //           },
              //           child: Text(
              //             "view_all".tr(),
              //             textAlign: TextAlign.end,
              //             overflow: TextOverflow.ellipsis,
              //             style: TextStyle(
              //               fontFamily: "Alexandria",
              //               fontSize: 12.sp,
              //               fontWeight: FontWeight.w600,
              //               color: const Color(0xff231F20),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
                  return   ProductHorizontalCard(categoryName: "new_arrivals".tr() ,product:cubit.newProductList ,);

                },
              ),
             // const NewArrivalcart()
            ],
          ),
        ),
      ),
    );
  }
}
