import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/payment/presentation/screens/request_succeffuly_excuted.dart';

class DeliveryTimeScreen extends StatefulWidget {
  const DeliveryTimeScreen({super.key});

  @override
  State<DeliveryTimeScreen> createState() => _DeliveryTimeScreenState();
}

class _DeliveryTimeScreenState extends State<DeliveryTimeScreen> {
  String deliveryTimeOption = "now";
  bool isCashOnDelivery = true;

  String selectedDay = "today";
  String selectedTimeSlot = "03:00 - 04:00م";

  final List<String> timeSlots = [
    "10:00 - 11:00ص",
    "11:00 - 12:00م",
    "12:00 - 01:00م",
    "01:00 - 02:00م",
    "02:00 - 03:00م",
    "03:00 - 04:00م",
    "04:00 - 05:00م",
    "05:00 - 06:00م",
    "06:00 - 07:00م",
    "07:00 - 08:00م",
    "08:00 - 09:00م",
  ];

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Group (9).png"),
              Text(
                "choose delivery time".tr(),
                style: TextStyle(
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
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
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("choose delivery time".tr(),
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff231F20))),
              SizedBox(height: 10.h),
              buildRadioOption("delivery now".tr(), "now"),
              SizedBox(height: 5.w),
              buildRadioOption("delivery later".tr(), "later"),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDayLabel("tomorrow".tr(), "tomorrow"),
                  SizedBox(
                    width: 10.w,
                  ),
                  buildDayLabel("today".tr(), "today"),
                ],
              ),
              SizedBox(height: 10.h),
              GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2.5,
                children: timeSlots.map((time) => buildTimeSlot(time)).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Divider(
                  height: 40.h,
                  color: AppColors.mainAppColor,
                ),
              ),
              SizedBox(height: 10.h),
              Text("payment method".tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff231F20),
                  )),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: isCashOnDelivery,
                    activeColor: AppColors.mainAppColor,
                    onChanged: (value) {
                      setState(() {
                        isCashOnDelivery = value!;
                      });
                    },
                  ),
                  Text(
                    'cash on delivery'.tr(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff231F20),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Image.asset(
                    'assets/images/Vector (28).png',
                    width: 24,
                    height: 24,
                    color: AppColors.mainAppColor,
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Divider(
                    height: 40.h,
                    color: AppColors.mainAppColor,
                  )),
              buildSummaryRow("the subtotal".tr(), "100"),
              buildSummaryRow("delivery fees".tr(), "10"),
              buildSummaryRow("discount rate".tr(), "0"),
              buildSummaryRow("discount rate".tr(), "0"),
              SizedBox(
                height: 10.h,
              ),
              buildSummaryRow("total".tr(), "110.00", isTotal: true),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainAppColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const RequestSuccessfullyExecuted()));
                  },
                  child: Text("payment".tr(),
                      style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioOption(String label, String value) {
    bool selected = deliveryTimeOption == value;
    return InkWell(
      onTap: () => setState(() => deliveryTimeOption = value),
      child: Row(
        children: [
          Radio(
            value: value,
            groupValue: deliveryTimeOption,
            onChanged: (val) => setState(() => deliveryTimeOption = val!),
            activeColor: AppColors.mainAppColor,
          ),
          Text(label, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }

  Widget buildDayLabel(String label, String value) {
    bool selected = selectedDay == value;
    return GestureDetector(
      onTap: () => setState(() => selectedDay = value),
      child: Container(
        width: 150.w,
        height: 37,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.mainAppColor : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : AppColors.mainAppColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimeSlot(String time) {
    bool selected = selectedTimeSlot == time;
    return GestureDetector(
      onTap: () => setState(() => selectedTimeSlot = time),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.mainAppColor : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 10.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 15.sp : 14.sp,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          Text(
            "$value ${'pounds'.tr()}",
            style: TextStyle(
              fontSize: isTotal ? 16.sp : 14.sp,
              color: isTotal ? AppColors.mainAppColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
