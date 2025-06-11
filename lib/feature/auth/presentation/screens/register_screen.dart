import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart' show AppColors;
import 'package:settings_app/core/constant/custom_bottom.dart';
import 'package:settings_app/core/constant/custom_text_field.dart';
import 'package:settings_app/feature/auth/presentation/screens/login_screen.dart';
import 'package:settings_app/feature/auth/presentation/widget/wave_background_painter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailcontrroler;
  late TextEditingController addressdetailscontrroler;
  late TextEditingController firstnamecontrroler;
  late TextEditingController lastnamecontrroler;
  late TextEditingController passwordcontrroler;
  late TextEditingController confermpasswordcontrroler;
  late TextEditingController phonenumbercontrroler;
  late TextEditingController governoratecontrrler;
  late TextEditingController regioncontrrler;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController floorController;
  late TextEditingController flooridController;
  late TextEditingController homeController;
  late TextEditingController regionController;
  final formkey = GlobalKey<FormState>();

  bool isCairoSelected = false;
  bool isMansouraSelected = false;
  bool isCairoRegionSelected = false;
  bool isMansouraRegionSelected = false;

  @override
  void initState() {
    regionController = TextEditingController();
    homeController = TextEditingController();
    regioncontrrler = TextEditingController();
    addressdetailscontrroler = TextEditingController();
    governoratecontrrler = TextEditingController();
    lastnamecontrroler = TextEditingController();
    firstnamecontrroler = TextEditingController();
    phonenumbercontrroler = TextEditingController();
    confermpasswordcontrroler = TextEditingController();
    emailcontrroler = TextEditingController();
    passwordcontrroler = TextEditingController();
    cityController = TextEditingController();
    streetController = TextEditingController();
    floorController = TextEditingController();
    flooridController = TextEditingController();
    super.initState();
  }

  bool ispassword = true;
  bool isresetpassword = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: CustomPaint(
            painter: WaveBackgroundPainter(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  40.verticalSpace,
                  Center(
                    child: Text(
                      'create_new_account'.tr(),
                      style: TextStyle(
                        color: AppColors.mainAppColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Alexandria",
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  Container(
                    width: MediaQuery.sizeOf(context).width * .8,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              prefix: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(AppAssets.firstname),
                              ),
                              controller: firstnamecontrroler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_enter_your_first_name".tr();
                                }
                                return null;
                              },
                              textInputType: TextInputType.text,
                              hintText: "first_name".tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              prefix: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(AppAssets.firstname),
                              ),
                              controller: lastnamecontrroler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_enter_your_last_name".tr();
                                }
                                return null;
                              },
                              textInputType: TextInputType.text,
                              hintText: "last_name".tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              prefix: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(AppAssets.phonenumber),
                              ),
                              controller: phonenumbercontrroler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_enter_your_phone_number".tr();
                                }
                                if (value.length < 11) {
                                  return "phone_number_must_be_at_least_11_digits"
                                      .tr();
                                }
                                return null;
                              },
                              textInputType: TextInputType.phone,
                              hintText: "phone_number".tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 16, left: 16, top: 10, bottom: 10),
                            child: Align(
                              alignment: context.locale == const Locale('ar')
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                              child: Text(
                                "phone_number_(not_less_than_11_digits)".tr(),
                                style: TextStyle(
                                  color: const Color(
                                    0xff231F20,
                                  ),
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              prefix: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(AppAssets.email),
                              ),
                              controller: emailcontrroler,
                              validator: (value) {
                                if (value!.isNotEmpty && !value.contains('@')) {
                                  return "please_enter_your_email".tr();
                                }
                                return null;
                              },
                              textInputType: TextInputType.emailAddress,
                              hintText: "email_(optional)".tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              prefix: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image.asset(AppAssets.password),
                              ),
                              controller: passwordcontrroler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "password(not_less_than_8_letters)"
                                      .tr();
                                }
                                if (value.length < 8) {
                                  return "password(not_less_than_8_letters)"
                                      .tr();
                                }
                                return null;
                              },
                              hintText: "password".tr(),
                              obscureText: ispassword,
                              subfix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    ispassword = !ispassword;
                                  });
                                },
                                icon: Icon(
                                  ispassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.remove_red_eye,
                                ),
                                color: const Color(0xff6A707C),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 16, left: 16, top: 10, bottom: 10),
                            child: Align(
                              alignment: context.locale == const Locale('ar')
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                              child: Text(
                                "password(not_less_than_8_letters)".tr(),
                                style: TextStyle(
                                  color: const Color(
                                    0xff231F20,
                                  ),
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              prefix: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(AppAssets.password),
                              ),
                              controller: confermpasswordcontrroler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_confirm_your_password".tr();
                                }
                                if (value != passwordcontrroler.text) {
                                  return "passwords_do_not_match".tr();
                                }
                                return null;
                              },
                              hintText: "confirm_password".tr(),
                              obscureText: isresetpassword,
                              subfix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isresetpassword = !isresetpassword;
                                  });
                                },
                                icon: Icon(
                                  isresetpassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.remove_red_eye,
                                ),
                                color: const Color(0xff6A707C),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppAssets.address),
                                SizedBox(width: 5.w),
                                Text(
                                  'address'.tr(),
                                  style: TextStyle(
                                    fontFamily: "Alexandria",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.mainAppColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 5),
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
                                                  title: Center(
                                                      child:
                                                          Text("cairo".tr())),
                                                  onTap: () {
                                                    setState(() {
                                                      governoratecontrrler
                                                          .text = "cairo".tr();
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                ListTile(
                                                  title: Center(
                                                      child: Text(
                                                          "mansoura".tr())),
                                                  onTap: () {
                                                    setState(() {
                                                      governoratecontrrler
                                                              .text =
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
                                    icon: Image.asset(
                                        "assets/images/Polygon 11.png"),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 5),
                              decoration: BoxDecoration(
                                color: const Color(0xffEEEEEE),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ListTile(
                                                  title: Center(
                                                      child:
                                                          Text("cairo".tr())),
                                                  onTap: () {
                                                    setState(() {
                                                      regioncontrrler.text =
                                                          "cairo".tr();
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                ListTile(
                                                  title: Center(
                                                      child: Text(
                                                          "mansoura".tr())),
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
                                    icon: Image.asset(
                                        "assets/images/Polygon 11.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              controller: cityController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_enter_your_city".tr();
                                }
                                return null;
                              },
                              hintText: "city".tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              controller: streetController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_enter_your_street".tr();
                                }
                                return null;
                              },
                              hintText: "street".tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              controller: floorController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_enter_building_name_or_number"
                                      .tr();
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
                              controller: flooridController,
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
                              hintFontSize: 10,
                              textInputType: TextInputType.number,
                              controller: homeController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_enter_apartment_or_villa_number"
                                      .tr();
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
                              controller: regionController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_enter_address_type".tr();
                                }
                                return null;
                              },
                              hintText:
                                  "name_the_title_(House-Apartment-Office)"
                                      .tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: CustomTextFormField(
                              hintFontSize: 10,
                              maxLines: 5,
                              controller: addressdetailscontrroler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please_enter_delivery_instructions"
                                      .tr();
                                }
                                return null;
                              },
                              hintText: "delivery_instructions".tr(),
                            ),
                          ),
                          40.verticalSpace,
                          Center(
                            child: CustomButton(
                              width: 227.w,
                              height: 38.h,
                              text: "sign up".tr(),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  // يمكنك تنفيذ عملية التسجيل هنا
                                  // registerUser();
                                }
                              },
                            ),
                          ),
                          20.verticalSpace,
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "have_account".tr(),
                                style: TextStyle(
                                  color: AppColors.mainAppColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
