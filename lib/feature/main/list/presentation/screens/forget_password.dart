import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool ispassword = true;
  TextEditingController passwordcontrroler = TextEditingController();
    TextEditingController newpasscontrroler = TextEditingController();
  TextEditingController confermpasswordcontrroler = TextEditingController();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15.h),
              Image.asset(AppAssets.forgetpassword),
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
                      return "Please enter your confirm password";
                    }
                    if (value != passwordcontrroler.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  hintText: "the_old_password".tr(),
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
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: CustomTextFormField(
                  hintFontSize: 6,
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
                    return null;
                  },
                  hintText:
                      "the_new_password_new_password(must_be_at_least_8_letters_or_numbers)"
                          .tr(),
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
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: CustomTextFormField(
                  hintFontSize: 10,
                  prefix: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(AppAssets.password),
                  ),
                  controller: newpasscontrroler,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your confirm password";
                    }
                    if (value != passwordcontrroler.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  hintText: "confirm_the_new_password".tr(),
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
                padding: const EdgeInsets.only(right: 16, left: 16, top: 40),
                child: SizedBox(
                  width: 386.w,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainAppColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.lock_outline, color: Colors.white),
                      label: Text(
                        "change_the_password".tr(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: () {}),
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
