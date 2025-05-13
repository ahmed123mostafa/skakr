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

  final formkey = GlobalKey<FormState>();
  
  @override
  void initState() {
    regioncontrrler = TextEditingController();
    addressdetailscontrroler = TextEditingController();
    governoratecontrrler = TextEditingController();
    lastnamecontrroler = TextEditingController();
    firstnamecontrroler = TextEditingController();
    phonenumbercontrroler = TextEditingController();
    confermpasswordcontrroler = TextEditingController();
    emailcontrroler = TextEditingController();
    passwordcontrroler = TextEditingController();
    super.initState();
  }

  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: CustomTextFormField(
                            prefix: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(AppAssets.firstname),
                            ),
                            controller: firstnamecontrroler,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " please Enter your first name";
                              }
                            },
                            textInputType: TextInputType.text,
                            hintText: "first_name".tr(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: CustomTextFormField(
                            prefix: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(AppAssets.firstname),
                            ),
                            controller: lastnamecontrroler,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " please Enter your last name";
                              }
                            },
                            textInputType: TextInputType.text,
                            hintText: "last_name".tr(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: CustomTextFormField(
                            prefix: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(AppAssets.phonenumber),
                            ),
                            controller: phonenumbercontrroler,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " please Enter your phone number";
                              }
                            },
                            textInputType: TextInputType.phone,
                            hintText:
                                "phone_number_(not_less_than_11_digits)".tr(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: CustomTextFormField(
                            prefix: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(AppAssets.email),
                            ),
                            controller: emailcontrroler,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " please Enter your email";
                              }
                            },
                            textInputType: TextInputType.emailAddress,
                            hintText: "email_(optional)".tr(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: CustomTextFormField(
                            hintFontSize: 9,
                            prefix: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(AppAssets.password),
                            ),
                            controller: passwordcontrroler,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              }

                              if (value.length < 7) {
                                return "password must be at least 7 digits";
                              }
                            },
                            hintText:
                                "password_(not_less_than_8_letters)".tr(),
                            obscureText: ispassword,
                            subfix: IconButton(
                              onPressed: () {
                                setState(() {
                                  ispassword = !ispassword;
                                });
                              },
                              icon: Icon(
                                ispassword
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                              ),
                              color: const Color(0xff6A707C),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: CustomTextFormField(
                            prefix: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(AppAssets.password),
                            ),
                            controller: confermpasswordcontrroler,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your confirm password";
                              }

                              if (value.length < 7) {
                                return "password must be at least 7 digits";
                              }
                            },
                            hintText: "confirm_password".tr(),
                            obscureText: ispassword,
                            subfix: IconButton(
                              onPressed: () {
                                setState(() {
                                  ispassword = !ispassword;
                                });
                              },
                              icon: Icon(
                                ispassword
                                    ? Icons.remove_red_eye_outlined
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
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: CustomTextFormField(
                                  controller: governoratecontrrler,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your governorate";
                                    }
                                    return null;
                                  },
                                  hintText: "governorate".tr(),
                                  obscureText: ispassword,
                                  subfix: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_drop_down,
                                        size: 30),
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
                                  controller: regioncontrrler,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your region";
                                    }
                                    return null;
                                  },
                                  hintText: "region".tr(),
                                  obscureText: ispassword,
                                  subfix: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_drop_down,
                                        size: 30),
                                    color: const Color(0xff231F20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: CustomTextFormField(
                            controller: confermpasswordcontrroler,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your city";
                              }
                            },
                            hintText: "city".tr(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: CustomTextFormField(
                            controller: confermpasswordcontrroler,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your address details";
                              }
                            },
                            hintText: "address_details".tr(),
                          ),
                        ),
                        40.verticalSpace,
                        Center(
                          child: CustomButton(
                            width: 227.w,
                            height: 38.h,
                            text: "check_in".tr(),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
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
                              "already_have_account".tr(),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

