import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_text_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../home/presentation/widget/custom_quantity_counter.dart';

class DetailsScreen extends StatelessWidget {
  final pageController = PageController();
  DetailsScreen({super.key});

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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.only(right: 1),
                        width: 107,
                        height: 43,
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
                          hintText:
                              "type_here_the_one_you_want_to_search_for".tr(),
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
                            Text(
                              "2",
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Image.asset(AppAssets.menuuu),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.mainAppColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: double.infinity,
                height: 560.h,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset("assets/images/Group 123.png")),
                    ),
                    SizedBox(
                      height: 150,
                      child: PageView.builder(
                          controller: pageController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              AppAssets.apple,
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25.h),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "imported_green_apple_1kg".tr(),
                          style: TextStyle(
                            fontFamily: "Alexandria",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff231F20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 35.h),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "5,00  ".tr(),
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff231F20),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          " جنيه ".tr(),
                          style: TextStyle(
                            fontFamily: "Alexandria",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff231F20).withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                color: AppColors
                                    .mainAppColor, 
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
                                "متوفر",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Alexandria",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              'SN : 2494',
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
                    SizedBox(height: 5.h,),
                  Row(
                    children: [
                      const  OfferToggleSlider(),
                      SizedBox(width: 20.w,),
                      Container(
                        padding:const  EdgeInsets.all(
                                 10),
                        height: 40.h,
            width: 160.w, 
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
            ),child: Row(
              children: [
              Text(
                          "أضافة الي السلة",
                          style: TextStyle(
                            fontFamily: "Alexandria",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff231F20),
                          ),
                        ),
                       const  Spacer(),
                       Container(
                        width: 36,
                        height: 31,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.mainAppColor
                        ),
                        child: Image.asset("assets/images/Layer 2 (1).png"))

            ],),
                        
                      )
                    ],
                  )
                  
                  ,SizedBox(height: 20.h,),
             const     Padding(
                   padding:  EdgeInsets.only(left: 45,right: 45),
                   
                   child:   Divider(color: Color(0xff231F20),
                    thickness: 1,
                    ),
                 ),
                  Padding(
                      padding: EdgeInsets.only(right: 25.h),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "الوصف",
                          style: TextStyle(
                            fontFamily: "Alexandria",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff231F20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25.h,left: 15),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "استعد لتذوق الطعم اللذيذ لبطاطس القلي الهشة! مع طبيعتها المتعددة الاستخدامات وطعمها اللذيذ تعتبر بطاطس القلي مكوتا أساسيا في مطابخ العديد من الثقافات في جميع أنحاء العالم.",
                          style: TextStyle(
                            fontFamily: "Alexandria",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff231F20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                              "رؤية المزيد",
                              style: TextStyle(
                                fontFamily: "Alexandria",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                            SizedBox(width: 5.w,),
                           Image.asset("assets/images/Vector 348.png")
                      ],
                    ),
                    
                    

                  
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
               Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "similar_products".tr(),
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
            const  SimilairProduct(),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "most_requested".tr(),
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
               const  SimilairProduct(),
              
                Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        " i_watched_it_recently".tr(),
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
               const  SimilairProduct(),

            
            ],
          ),
        ),
      ),
    );
  }
}


class OfferToggleSlider extends StatefulWidget {
  const OfferToggleSlider({super.key});

  @override
  State<OfferToggleSlider> createState() => _OfferToggleSliderState();
}

class _OfferToggleSliderState extends State<OfferToggleSlider> {
  bool isOffersSelected = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOffersSelected = !isOffersSelected;
        });
      },
      child: Padding(
         padding: const EdgeInsets.only(right: 25),
        child: Align(
           alignment: Alignment.topRight,
          child: Container(
            height: 40.h,
            width: 140.w, 
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
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: isOffersSelected ? 0 : 80.w,
                  right: isOffersSelected ? 80.w : 0,
                  child: Container(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: AppColors.mainAppColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'بالتة',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Alexandria",
                            color: isOffersSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'عبوة',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Alexandria",
                            color: !isOffersSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SimilairProduct extends StatelessWidget {
  const SimilairProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,  
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, 
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 190,
                      height: 228,
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
                            top: 40,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Image.asset(
                                AppAssets.offer,
                                width: 90,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset("assets/images/Vector 356.png"),
                                const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: Text(
                                        '10%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'OFF',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
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
                            top: 120,
                            right: 12,
                            child: Text(
                              '5.00 جنيه',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.mainAppColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Alexandria",
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 145,
                            right: 12,
                            left: 12,
                            child: Text(
                              'النور برتقال عصير مصري 2كجم',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Alexandria",
                                fontSize: 11,
                                color: Color(0xff231F20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                   const  Positioned(
                      bottom: -15,
                      left: 0,
                      right: 0,
                      child: Center(
                        child:QuantityCounter()
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 12), 

                
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 190,
                      height: 228,
                      margin: const EdgeInsets.all(8),
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
                            top: 40,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Image.asset(
                                AppAssets.offer,
                                width: 90,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            left: 0,
                            child:
                                Icon(Icons.favorite_border, color: Colors.grey),
                          ),
                          Positioned(
                            top: 120,
                            right: 12,
                            child: Text(
                              '5.00 جنيه',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.mainAppColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Alexandria",
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 145,
                            right: 12,
                            left: 12,
                            child: Text(
                              'النور برتقال عصير مصري 2كجم',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Alexandria",
                                fontSize: 11,
                                color: Color(0xff231F20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainAppColor,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                          ),
                          child: Text(
                            'إضافة للسلة',
                            style: TextStyle(
                              fontFamily: "Alexandria",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}