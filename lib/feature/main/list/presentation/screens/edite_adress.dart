import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_text_field.dart';

class EditeAddress extends StatefulWidget {
  const EditeAddress({super.key});

  @override
  State<EditeAddress> createState() => _EditeAddressState();
}

class _EditeAddressState extends State<EditeAddress> {
  final TextEditingController tableeditingController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController regionController = TextEditingController();

  @override
  void dispose() {
    tableeditingController.dispose();
    confirmPasswordController.dispose();
    streetController.dispose();
    governorateController.dispose();
    regionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF3F3F3),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.5),
          centerTitle: true,
          title: Text(
            "edit_address".tr(),
            style: TextStyle(
              color: AppColors.mainAppColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          leading: Icon(
            Icons.arrow_back,
            color: AppColors.mainAppColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 30.h),

                /// Address label field
                CustomTextFormField(
                  controller: tableeditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your address";
                    }
                    return null;
                  },
                  textInputType: TextInputType.text,
                  hintText: "مكتب",
                ),

                SizedBox(height: 20.h),

                /// Header for current address
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.mainAppColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/Group 186 (1).png"),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          "current_address".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                /// City
                CustomTextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your city";
                    }
                    return null;
                  },
                  hintText: "الدقهلية",
                  subfix: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down, size: 30),
                    color: const Color(0xff231F20),
                  ),
                ),

                SizedBox(height: 16.h),

                /// Street
                CustomTextFormField(
                  controller: streetController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your street";
                    }
                    return null;
                  },
                  hintText: "طلخا",
                  subfix: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down, size: 30),
                    color: const Color(0xff231F20),
                  ),
                ),

                SizedBox(height: 16.h),

                /// Governorate and Region
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CustomTextFormField(
                          controller: governorateController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your governorate";
                            }
                            return null;
                          },
                          hintText: "شارع الزراعة",
                          subfix: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_down, size: 30),
                            color: const Color(0xff231F20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: CustomTextFormField(
                          controller: regionController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your region";
                            }
                            return null;
                          },
                          hintText: "برج المغازي",
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
