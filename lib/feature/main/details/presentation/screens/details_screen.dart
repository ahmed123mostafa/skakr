import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_text_field.dart';
import 'package:settings_app/feature/main/catagory/manager/category_cubit.dart';
import 'package:settings_app/feature/main/catagory/manager/category_state.dart';
import 'package:settings_app/feature/main/details/presentation/widget/custom_similair_product.dart';
import 'package:settings_app/feature/main/details/presentation/widget/offer_toogel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../home/manager/cubit/home_cubit.dart';
import '../../../home/presentation/widget/product_horizontal_card.dart';
import '../../manager/product_details_cubit.dart';
import '../../manager/product_details_state.dart';




class DetailsScreen extends StatelessWidget {
  final PageController pageController = PageController();
  final int selectedQuantity;
  final num productId;

  DetailsScreen({super.key, this.selectedQuantity = 1,required this.productId});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double w(double width) => screenWidth * width / 375;
    double h(double height) => screenHeight * height / 812;
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context)=>ProductDetailsCubit()..getProductDetails(productId: productId),
            child: BlocBuilder<ProductDetailsCubit,ProductDetailsState>(
              builder: (context,state) {
                ProductDetailsCubit detailsCubit=BlocProvider.of<ProductDetailsCubit>(context);
                return


                  ConditionalBuilder(
                    condition:  state is! GetProductDetailsLoading&&detailsCubit.productDetailsList.isNotEmpty,
    builder:(context){
                      return  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: h(20)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.only(right: w(1)),
                                    width: w(107),
                                    height: h(43),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
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
                                    child: CustomTextFormField(
                                      fillColor: Colors.white,
                                      prefix: const Icon(Icons.search),
                                      hintFontSize: 9.sp,
                                      hintText:
                                      "type_here_the_one_you_want_to_search_for".tr(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: w(107),
                                    height: h(43),
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
                                        Text(
                                          "2",
                                          style: TextStyle(
                                            fontFamily: "Alexandria",
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.mainAppColor,
                                          ),
                                        ),
                                        SizedBox(width: w(5)),
                                        Image.asset(AppAssets.menuuu),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: w(3)),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.mainAppColor,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: h(20)),
                          Container(
                            width: double.infinity,
                            height: h(580),
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(height: h(20)),
                                const Padding(
                                  padding: EdgeInsets.only(left: 17),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: h(10)),
                                Padding(
                                  padding: EdgeInsets.only(left: w(20)),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Image.asset("assets/images/Group 123.png")),
                                ),
                                SizedBox(
                                  height: h(150),
                                  child: PageView.builder(
                                      controller: pageController,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount:  detailsCubit.productDetailsList[0].productUnitImages?.length??0,
                                      itemBuilder: (context, index) {
                                        return

                                          Image.network(
                                            detailsCubit.productDetailsList?[0].productUnitImages?[index].imagePath??'',
                                            fit: BoxFit.fill,
                                          );
                                      }),
                                ),
                                Center(
                                  child: SmoothPageIndicator(
                                    controller: pageController,
                                    count: 2,
                                    axisDirection: Axis.horizontal,
                                    effect: SlideEffect(
                                        spacing: 8.0,
                                        radius: 25,
                                        dotWidth: 16,
                                        dotHeight: 16.0,
                                        paintStyle: PaintingStyle.stroke,
                                        strokeWidth: 1.5,
                                        dotColor: Colors.grey,
                                        activeDotColor: AppColors.mainAppColor),
                                  ),
                                ),
                                SizedBox(height: h(20)),
                                Padding(
                                  padding: EdgeInsets.only(right: w(25), left: w(25)),
                                  child: Align(
                                    alignment: context.locale == const Locale('ar')
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                    child: Text(
                                      isArabic?
                                      detailsCubit.productDetailsList[0].productArName??'':
                                     detailsCubit.productDetailsList?[0].productEnName??'',
                                      style: TextStyle(
                                        fontFamily: "Alexandria",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff231F20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: h(10)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        '${detailsCubit.productDetailsList[0].priceAfterDiscount}'??'',
                                        style: TextStyle(
                                          fontFamily: "Alexandria",
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff231F20),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "pound".tr(),
                                      style: TextStyle(
                                        fontFamily: "Alexandria",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff231F20).withOpacity(0.7),
                                      ),
                                    ),
                                    SizedBox(width: w(25)),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w(12), vertical: h(6)),
                                          decoration: BoxDecoration(
                                            color: AppColors.mainAppColor,
                                            borderRadius: BorderRadius.circular(20.r),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Text(
      (detailsCubit.productDetailsList[0].stockQuantity!>0)?
                                            "available".tr(): "unavailable".tr(),
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Alexandria",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: w(10)),
                                        Text(
                                          'SN : ${detailsCubit.productDetailsList[0].productID}',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Alexandria",
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(width: h(10)),
                                SizedBox(height: h(15)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const OfferToggleSlider(),
                                    SizedBox(width: w(20)),
                                    InkWell(
                                      onTap: () async {
                                        int? result = await showDialog<int>(
                                          context: context,
                                          builder: (context) => quantityDialog(context),
                                        );
                                        if (result != null) {

                                          //    selectedQuantity = result;

                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        height: h(40),
                                        width: w(160),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.4),
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "add_to_cart".tr(),
                                              style: TextStyle(
                                                fontFamily: "Alexandria",
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff231F20),
                                              ),
                                            ),
                                            Container(
                                              width: w(30),
                                              height: h(50),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(16),
                                                  color: AppColors.mainAppColor),
                                              child: Image.asset(
                                                "assets/images/Layer 2 (1).png",
                                                width: 20,
                                                height: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: h(20)),
                                const Padding(
                                  padding: EdgeInsets.only(left: 45, right: 45),
                                  child: Divider(
                                    color: Color(0xff231F20),
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: w(20), left: w(20)),
                                  child: Align(
                                    alignment: context.locale == const Locale('ar')
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                    child: Text(
                                      "description".tr(),
                                      style: TextStyle(
                                        fontFamily: "Alexandria",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff231F20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: h(5)),
                                Padding(
                                  padding: EdgeInsets.only(right: w(25), left: w(15)),
                                  child: Align(
                                    alignment: context.locale == const Locale('ar')
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                    child: Text(
                                      detailsCubit.productDetailsList[0].specifications.toString()??'',
                                      style: TextStyle(
                                        fontFamily: "Alexandria",
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff231F20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: h(10)),
                          BlocProvider(
                            create: (context)=>CategoryCubit()..getItemsForSubCategory(subCategoryId: int.parse(detailsCubit.productDetailsList[0].categoryId.toString())),
                            child: BlocBuilder<CategoryCubit, CategoryState>(
                              builder: (context, state) {
                                CategoryCubit cubit = BlocProvider.of<CategoryCubit>(context);
                                return ProductHorizontalCard(categoryName:  "similar_products".tr() ,product:cubit.itemsSubCategoryList ,);
                              },
                            ),
                          ),


                          Padding(
                            padding: EdgeInsets.all(w(8)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "most_requested".tr(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "Alexandria",
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.mainAppColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: w(3)),
                                Image.asset(AppAssets.line),
                                SizedBox(width: w(5)),
                                Expanded(
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
                              ],
                            ),
                          ),
                          const SimilairProduct(),
                          Padding(
                            padding: EdgeInsets.all(w(8)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "i_watched_it_recently".tr(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "Alexandria",
                                      fontSize: 7.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.mainAppColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: w(3)),
                                Image.asset(AppAssets.line),
                                SizedBox(width: w(5)),
                                Expanded(
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
                              ],
                            ),
                          ),
                          const SimilairProduct(),
                        ],
                      );
    },
                    fallback: (context){
                      return const SizedBox();
                    } ,

                  );
              }
            ),
          ),
        ),
      ),
    );
  }
}




Widget quantityDialog(BuildContext context) {
  int quantity = 1;
  return StatefulBuilder(
    builder: (context, setState) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      setState(() => quantity--);
                    }
                  },
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      CustomPaint(
                        painter: CurvedButtonPainter(isLeft: true),
                        size: const Size(35, 80),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    quantity.toString().padLeft(2, '0'),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() => quantity++);
                  },
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      CustomPaint(
                        painter: CurvedButtonPainter(isLeft: false),
                        size: const Size(35, 80),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Text(
                          "+",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}




class CurvedButtonPainter extends CustomPainter {
  final bool isLeft;

  CurvedButtonPainter({required this.isLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFC10075);

    final path = Path();
    if (isLeft) {
      path.moveTo(size.width, 0);
      path.quadraticBezierTo(0, size.height * 0.5, size.width, size.height);
      path.lineTo(0, size.height);
      path.lineTo(0, 0);
    } else {
      path.moveTo(0, 0);
      path.quadraticBezierTo(size.width, size.height * 0.5, 0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
