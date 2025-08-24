import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class MyPreviousEmptyOrders extends StatelessWidget {
  const MyPreviousEmptyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        const Expanded(child: OrdersScreen()),
      ],
    );
  }
}

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 50.h),
        Expanded(
            child: selectedIndex == 0
                ? buildCurrentOrders()
                : buildPreviousOrders()),
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
          style: TextStyle(
              color: Colors.grey, fontSize: 25.sp, fontWeight: FontWeight.w500),
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
          style: TextStyle(
              color: Colors.grey, fontSize: 25.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
