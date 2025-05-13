import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class MyPreviousOrders extends StatelessWidget {
  const MyPreviousOrders({super.key});

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
            "my_previous_orders".tr(),
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
        body: Column(
          children: [
            SizedBox(height: 30.h),
           const  Expanded(child:  OrdersScreen()), 
          ],
        ),
      ),
    );
  }
}

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int selectedIndex = 0; // 0 = previous, 1 = current

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? const Color(0xffBA0B74)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(
                      child: Text(
                 "my_previous_orders".tr(),
                        style: TextStyle(
                          color: selectedIndex == 1
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? AppColors.mainAppColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(
                      child: Text(
                        "my_current_orders".tr(),
                        style: TextStyle(
                          color: selectedIndex == 0
                              ? Colors.white
                              : AppColors.mainAppColor,
                              fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50.h),
        Expanded(
          child: selectedIndex == 0
              ? buildCurrentOrders()
               :buildPreviousOrders()
             
        ),
      ],
    );
  }

  Widget buildPreviousOrders() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(AppAssets.cart234),
        SizedBox(height: 20.h),
        Text(
          "لم تقم بتسجيل اي طلب بعد",
          style: TextStyle(color: Colors.grey, fontSize: 25.sp,
          fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget buildCurrentOrders() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(AppAssets.cart234),
        SizedBox(height: 20.h),
        Text(
          "لم تقم بتسجيل اي طلب بعد",
          style: TextStyle(color: Colors.grey, fontSize: 25.sp,
          fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
