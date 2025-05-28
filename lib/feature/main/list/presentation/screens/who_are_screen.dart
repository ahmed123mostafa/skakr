import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class WhoAreScreen extends StatelessWidget {
  const WhoAreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.5),
        centerTitle: true,
        title: Text(
          "who_are_we?".tr(),
          style: TextStyle(
            color: AppColors.mainAppColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.mainAppColor,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 382.w,
                height: 709.h,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),

                // Two inner containers inside the big one
                child: Column(
                  children: [
                    // Title container (fixed at top of big container)
                    Container(
                      padding:
                          const EdgeInsets.only(right: 20, top: 20, left: 20),
                      height: 58.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.mainAppColor,
                      ),
                      child: Text(
                        "who_are_we?".tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    // Scrollable content container below the title
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "there_is_a_long_established_fact_that_the_readable_content_of_a_page_will_distract_the_reader_from_focusingon_the_text's_outer_appearance_or_the_layout_of_the_paragraphson_the_page_they_are_reading.therefore,the_Lorem_Ipsum_method_is_used."
                                .tr(),
                            style: TextStyle(
                              color: const Color(0xff181818),
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
