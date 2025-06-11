import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_bottom.dart';
import 'package:settings_app/core/constant/custom_text_field.dart';

class NewAddAddress extends StatefulWidget {
  const NewAddAddress({super.key});

  @override
  State<NewAddAddress> createState() => _NewAddAddressState();
}

class _NewAddAddressState extends State<NewAddAddress> {
  final TextEditingController labelcontrroler = TextEditingController();
  final TextEditingController governoratecontrrler = TextEditingController();
  final TextEditingController areacontrrler = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController apartmentcontrrler = TextEditingController();
  final TextEditingController deliveryController = TextEditingController();
  final TextEditingController regioncontrrler = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool isCairoSelected = false;
  bool isMansouraSelected = false;
  bool isCairoRegionSelected = false;
  bool isMansouraRegionSelected = false;

  @override
  void dispose() {
    labelcontrroler.dispose();
    areacontrrler.dispose();
    buildingController.dispose();
    floorController.dispose();
    apartmentcontrrler.dispose();
    deliveryController.dispose();
    governoratecontrrler.dispose();
    regioncontrrler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        appBar: AppBar(
          backgroundColor: const Color(0xffF1F1F1),
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.5),
          centerTitle: true,
          title: Text(
            "add a new address".tr(),
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
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomTextFormField(
                    hintFontSize: 10,
                    controller: labelcontrroler,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please_enter_address_type".tr();
                      }
                      return null;
                    },
                    hintText: "name_the_title_(House-Apartment-Office)".tr(),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Group 186 (1).png"),
                      SizedBox(width: 10.w),
                      Text(
                        "delivery address".tr(),
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
                    controller: areacontrrler,
                    hintFontSize: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter erea".tr();
                      }
                      return null;
                    },
                    hintText: "area".tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomTextFormField(
                    controller: buildingController,
                    hintFontSize: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please_enter_building_name_or_number".tr();
                      }
                      return null;
                    },
                    hintText:
                        "name/number_of_the_building_(apartment-tower-villa)"
                            .tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomTextFormField(
                    controller: floorController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please_enter_floor_number".tr();
                      }
                      return null;
                    },
                    hintText: "floor".tr(),
                    hintFontSize: 10,
                    obscureText: false,
                    textInputType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomTextFormField(
                    controller: apartmentcontrrler,
                    hintFontSize: 10,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please_enter_apartment_or_villa_number".tr();
                      }
                      return null;
                    },
                    hintText: "apartment/villa_number".tr(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: CustomTextFormField(
                    hintFontSize: 10,
                    maxLines: 5,
                    controller: deliveryController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please_enter_delivery_instructions".tr();
                      }
                      return null;
                    },
                    hintText: "delivery_instructions".tr(),
                  ),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: CustomButton(
                      width: 386.w,
                      height: 45.h,
                      text: "add address".tr(),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {}
                      },
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
