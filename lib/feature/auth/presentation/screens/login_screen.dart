import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_bottom.dart';
import 'package:settings_app/core/constant/custom_text_field.dart';
import 'package:settings_app/feature/auth/manager/auth_cubit.dart';
import 'package:settings_app/feature/auth/presentation/screens/register_screen.dart';
import 'package:settings_app/feature/auth/presentation/widget/custom_language.dart';
import 'package:settings_app/feature/auth/presentation/widget/custom_page.dart';
import 'package:settings_app/feature/auth/presentation/widget/wave_background_painter.dart';
import 'package:settings_app/feature/main/home/presentation/home_view.dart';

import '../../../../core/constant/conatant.dart';
import '../../../../core/network/secure_storage.dart';
import '../../manager/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  bool isPassword = true;
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context)=>AuthCubit(),
        child: BlocConsumer<AuthCubit,AuthState>(
          listener: (context,state)
            async {
              if(state is LoginViewStateSuccess)
              {

            print(state.dataUser);
            print(state.dataUser.arabicName);

            await SecureStorageService.write(SecureStorageService.mobile, state.dataUser.customerPhone.toString());
            await SecureStorageService.write(SecureStorageService.name, state.dataUser.arabicName.toString());
            await SecureStorageService.write(SecureStorageService.token, state.dataUser.customerId.toString());

            CustomerID = await SecureStorageService.read(SecureStorageService.token);
            customerPhone = await SecureStorageService.read(SecureStorageService.mobile);
            customerName = await SecureStorageService.read(SecureStorageService.name);

            Fluttertoast.showToast(
            msg: 'login_success'.tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );

            }

              if (state is LoginViewStateError) {
                Fluttertoast.showToast(
                  msg: 'login_noooooooooooosuccess'.tr(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                // customDialog(title:  'login_failed_subtitle'.tr(),context: context);




              }


            },
          builder: (context,state) {
           
            return SafeArea(
              child: SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: CustomPaint(
                  painter: WaveBackgroundPainter(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Align(
                          alignment: context.locale.languageCode == 'ar'
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              NavigationService.changeLanguage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.language,
                                      color: AppColors.mainAppColor,
                                      size: 16.sp,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      context.locale.languageCode == 'ar'
                                          ? 'En'
                                          : 'العربيه',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.mainAppColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 60,
                          ),
                          child: Image.asset(AppAssets.logo, width: screenWidth),
                        ),
                        Container(
                          width: screenWidth * 0.8,
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
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'login'.tr(),
                                  style: TextStyle(
                                    fontFamily: "Alexandria",
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.mainAppColor,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16, left: 16),
                                  child: CustomTextFormField(
                                    hintFontSize: 10,
                                    controller: phoneController,
                                    focusNode: phoneFocusNode,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please_enter_your_password".tr();
                                      }
                                      return null;
                                    },
                                    textInputType: TextInputType.phone,
                                    hintText: "phone_number".tr(),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(passwordFocusNode);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16, left: 16),
                                  child: CustomTextFormField(
                                    hintFontSize: 10.sp,
                                    controller: passwordController,
                                    focusNode: passwordFocusNode,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "password(not_less_than_8_letters)"
                                            .tr();
                                      }
                                      if (value.length < 7) {
                                        return "Password must be at least 7 characters"
                                            .tr();
                                      }
                                      return null;
                                    },
                                    hintText: "password".tr(),
                                    obscureText: isPassword,
                                    textInputAction: TextInputAction.done,
                                    subfix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPassword = !isPassword;
                                        });
                                      },
                                      icon: Icon(isPassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.remove_red_eye),
                                      color: const Color(0xff6A707C),
                                    ),
                                    onFieldSubmitted: (_) {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const HomeView(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                const HomePage(),
                                SizedBox(
                                  height: 10.h,
                                ),

                                ConditionalBuilder(
                                  condition:state is !LoginViewStateLoading  ,
                                  builder:(context){
                                    return

                                      CustomButton(
                                        text: "log in".tr(),
                                        borderRadius: 20,
                                        onPressed: () {
                                          if (formKey.currentState!.validate()) {
                                            BlocProvider.of<AuthCubit>(context).userLogin(customerPhone: phoneController.text, password: passwordController.text);
                                          }
                                        },
                                        width: 227,
                                        height: 38,
                                        fontSize: 14,
                                      );



                                  } ,
                                  fallback:(context){
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.mainAppColor,
                                        strokeWidth: 1.0,
                                      ),
                                    );

                                  } ,

                                ),

                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  width: 30.w,
                                  height: 24.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFE9E9E9),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'or'.tr(),
                                      style: TextStyle(
                                        fontFamily: "Alexandria",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Center(
                                  child: Text(
                                    "don't have an account?".tr(),
                                    style: TextStyle(
                                      fontFamily: "Alexandria",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.mainAppColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                CustomButton(
                                  text: "no account".tr(),
                                  borderRadius: 20,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const RegisterScreen(),
                                      ),
                                    );
                                  },
                                  width: 227,
                                  height: 38,
                                  fontSize: 8,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  width: 30.w,
                                  height: 24.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFE9E9E9),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'or'.tr(),
                                      style: TextStyle(
                                        fontFamily: "Alexandria",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                CustomButton(
                                  text: "follow_a_guest".tr(),
                                  borderRadius: 20,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomeView(),
                                      ),
                                    );
                                  },
                                  width: 227,
                                  height: 38,
                                  fontSize: 14,
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
            );
          }
        ),
      ),
    );
  }
}

