import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_bottom.dart';
import 'package:settings_app/core/constant/custom_text_field.dart';

class EditeAddress extends StatefulWidget {
  const EditeAddress({super.key});

  @override
  State<EditeAddress> createState() => _EditeAddressState();
}

class _EditeAddressState extends State<EditeAddress> {
  final TextEditingController confermpasswordcontrroler =
      TextEditingController();
  final TextEditingController regioncontrrler = TextEditingController();
  final TextEditingController tableeditingController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController governoratecontrrler = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  bool isCairoSelected = false;
  bool isMansouraSelected = false;
  bool isCairoRegionSelected = false;
  bool isMansouraRegionSelected = false;

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
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomTextFormField(
                    hintFontSize: 10,
                    controller: tableeditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter your address";
                      }
                      return null;
                    },
                    textInputType: TextInputType.text,
                    hintText: "office".tr(),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 223.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.mainAppColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Group 186 (1).png"),
                      SizedBox(width: 10.w),
                      Text(
                        "current_address".tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            governoratecontrrler.text.isEmpty
                                ? "governorate".tr()
                                : governoratecontrrler.text,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0xff231F20),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title:
                                            Center(child: Text("cairo".tr())),
                                        onTap: () {
                                          setState(() {
                                            governoratecontrrler.text =
                                                "cairo".tr();
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Center(
                                            child: Text("mansoura".tr())),
                                        onTap: () {
                                          setState(() {
                                            governoratecontrrler.text =
                                                "mansoura".tr();
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Image.asset("assets/images/Polygon 11.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            regioncontrrler.text.isEmpty
                                ? "region".tr()
                                : regioncontrrler.text,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0xff231F20),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ListTile(
                                        title:
                                            Center(child: Text("cairo".tr())),
                                        onTap: () {
                                          setState(() {
                                            regioncontrrler.text = "cairo".tr();
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Center(
                                            child: Text("mansoura".tr())),
                                        onTap: () {
                                          setState(() {
                                            regioncontrrler.text =
                                                "mansoura".tr();
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Image.asset("assets/images/Polygon 11.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomTextFormField(
                    hintFontSize: 10,
                    controller: governorateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your governorate";
                      }
                      return null;
                    },
                    hintText: "agriculture_street".tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomTextFormField(
                    hintFontSize: 10,
                    controller: regionController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your region";
                      }
                      return null;
                    },
                    hintText: "al-maghazi_tower".tr(),
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomTextFormField(
                      hintFontSize: 10,
                      maxLines: 5,
                      controller: confermpasswordcontrroler,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your address details";
                        }
                        return null;
                      },
                      hintText:
                          "mansoura_talkha_corner_of_agriculture_street_al-Maghazi_tower"
                              .tr()),
                ),
                40.verticalSpace,
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: CustomButton(
                      width: 386.w,
                      height: 45.h,
                      text: "edit_address".tr(),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
