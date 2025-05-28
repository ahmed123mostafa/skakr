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
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextFormField(
                  controller: tableeditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your address";
                    }
                    return null;
                  },
                  textInputType: TextInputType.text,
                  hintText: "name the title (house-apartment-office)".tr(),
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 115,
                          height: 50,
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
                                        title: Text("choose_governorate".tr()),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CheckboxListTile(
                                              title: Text("cairo".tr()),
                                              value: isCairoSelected,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isCairoSelected = value!;
                                                  governoratecontrrler.text =
                                                      "cairo".tr();
                                                });
                                              },
                                            ),
                                            CheckboxListTile(
                                              title: Text("mansoura".tr()),
                                              value: isMansouraSelected,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isMansouraSelected = value!;
                                                  governoratecontrrler.text =
                                                      "mansoura".tr();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            child: Text("ok".tr()),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon:
                                    Image.asset("assets/images/Polygon 11.png"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 115,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
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
                                        title: Text("choose_region".tr()),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CheckboxListTile(
                                              title: Text("cairo".tr()),
                                              value: isCairoRegionSelected,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isCairoRegionSelected =
                                                      value!;
                                                  regioncontrrler.text =
                                                      "cairo".tr();
                                                });
                                              },
                                            ),
                                            CheckboxListTile(
                                              title: Text("mansoura".tr()),
                                              value: isMansouraRegionSelected,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isMansouraRegionSelected =
                                                      value!;
                                                  regioncontrrler.text =
                                                      "mansoura".tr();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            child: Text("ok".tr()),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon:
                                    Image.asset("assets/images/Polygon 11.png"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CustomTextFormField(
                  controller: governorateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your governorate";
                    }
                    return null;
                  },
                  hintText: "area".tr(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CustomTextFormField(
                  controller: governorateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your governorate";
                    }
                    return null;
                  },
                  hintText:
                      "name/Number of the building (apartment-tower-villa)"
                          .tr(),
                ),
              ),
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
                        hintText: "floor".tr(),
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
                        hintText: "Apartment/Villa Number".tr(),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextFormField(
                    maxLines: 5,
                    controller: confermpasswordcontrroler,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your address details";
                      }
                      return null;
                    },
                    hintText: "delivery_instructions".tr()),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: CustomButton(
                    width: 386.w,
                    height: 45.h,
                    text: "add address".tr(),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
