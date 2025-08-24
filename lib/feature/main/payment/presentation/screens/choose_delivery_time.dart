import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/payment/manager/add_order_cubit.dart';
import 'package:settings_app/feature/main/payment/manager/add_order_state.dart';
import 'package:settings_app/feature/main/payment/presentation/screens/request_faluire.dart';
import 'package:settings_app/feature/main/payment/presentation/screens/request_succeffuly_excuted.dart';

import '../../../list/saved_address/model/all_address_model.dart';
import '../../../menu/manager/cart_cubit.dart';
import '../../../menu/manager/chat_state.dart';

class DeliveryTimeScreen extends StatelessWidget {
  DeliveryTimeScreen({super.key,required this.selectAddress,required this.cartItems});
  AllAddressModel? selectAddress;
  CartCubit? cartItems;

  final String deliveryTimeOption = "now";
  final bool isCashOnDelivery = true;
  final String selectedDay = "today";
   int deliveryId=100;
  var deliveryDate = DateTime.now();
  var deliveryTime = TimeOfDay.fromDateTime(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddOrderCubit()..getDeliveryTimes(),
        child: SafeArea(
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
                  InkWell(
                    onTap: (){
                      print(cartItems!.cartItems.length);
                    },
                    child: Text(
                      "choose delivery time".tr(),
                      style: TextStyle(
                        color: AppColors.mainAppColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
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
                  BlocBuilder< AddOrderCubit,  AddOrderState>(
                    builder: (context, state) {
                      final deliveryTimeOption = context.read<AddOrderCubit>().deliveryTimeOption;

                      return Column(
                        children: [
                          InkWell(

                          onTap: (){
                            deliveryId=100;
                            deliveryDate=DateFormat('yyyy-MM-dd','en').format(DateTime.now()) as DateTime;
                            deliveryTime= DateFormat('HH:mm:ss').format(DateTime.now()) as TimeOfDay;
                          }
                          ,child: buildRadioOption("delivery now".tr(), "now", deliveryTimeOption, context)),
                          SizedBox(height: 5.w),
                          buildRadioOption("delivery later".tr(), "later", deliveryTimeOption, context),
                        ],
                      );
                    },
                  ),





                  BlocBuilder<AddOrderCubit,AddOrderState>(
                    builder: (context,state) {
                      return Visibility(
                        visible:(context.read<AddOrderCubit>().deliveryTimeOption != "now")?true:false ,
                        replacement: const SizedBox(),
                        child: Column(
                          children: [
                        SizedBox(height: 20.h),
                            BlocBuilder<AddOrderCubit, AddOrderState>(
                              builder: (context, state) {
                                final deliveryCubit = context.read<AddOrderCubit>();

                                return Row(
                                  children: [
                                    DayLabel(
                                      label: "today".tr(),
                                      value: "today",
                                      selectedDay:deliveryCubit.selectedDay=="today"?true:false ,
                                      onTap: () => deliveryCubit.toggleSelectedDay(dayName: "today"),
                                    ),
                                    const Spacer(),
                                    DayLabel(
                                      label: "tomorrow".tr(),
                                      value: "tomorrow",
                                      selectedDay: deliveryCubit.selectedDay=="tomorrow"?true:false,
                                      onTap: () => deliveryCubit.toggleSelectedDay(dayName: "tomorrow"),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 10.h),
                            BlocBuilder<AddOrderCubit, AddOrderState>(
                                builder: (context, state) {
                                  return GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 8.h,
                                      crossAxisSpacing: 8.w,
                                      childAspectRatio: 2.5,
                                    ),
                                    itemCount: BlocProvider.of<AddOrderCubit>(context)
                                        .deliveryTimesList
                                        .length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){

                                          deliveryId= BlocProvider.of<AddOrderCubit>(context).deliveryTimesList[index].id;
                                          deliveryDate= DateFormat('yyyy-MM-dd', 'en').format(BlocProvider.of<AddOrderCubit>(context).selectedDay == "today"
                                              ? DateTime.now()
                                              : DateTime.now().add(const Duration(days: 1))) as DateTime;
                                          deliveryTime= DateFormat('HH:mm:ss').format(BlocProvider.of<AddOrderCubit>(context).deliveryTimesList[index].startTime) as TimeOfDay;
                                        },
                                        child: TimeSlotComponent(
                                          index: index,
                                          addOrderCubit:
                                          BlocProvider.of<AddOrderCubit>(context),
                                        ),
                                      );
                                    },
                                  );
                                }),
                          ],
                        ),
                      );
                    }
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: isCashOnDelivery,
                        activeColor: AppColors.mainAppColor,
                        onChanged: (_) {}, // No-op
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
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      height: 40.h,
                      color: AppColors.mainAppColor,
                    ),
                  ),
                  BlocBuilder<CartCubit,CartState>(
                    builder: (context,state) {
                      return SummaryRowComponent(label: "the subtotal".tr(), value: BlocProvider.of<CartCubit>(context).calculateTotalPrice().toStringAsFixed(2),);
                    }
                  ),

                  SummaryRowComponent(label: "delivery fees".tr(), value: "${selectAddress?.deliveryValue??0}"),
                  SummaryRowComponent(label: "discount rate".tr(), value: "0"),

                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: (){
                      print((double.tryParse(selectAddress?.deliveryValue.toString() ?? "0")));
                      print(BlocProvider.of<CartCubit>(context).calculateTotalPrice());
                    },
                    child: SummaryRowComponent(
                      label: "total".tr(),
                      value: (
                          (double.tryParse(selectAddress?.deliveryValue.toString() ?? "0") ?? 0) +
                              BlocProvider.of<CartCubit>(context).calculateTotalPrice()
                      ).toStringAsFixed(2),
                      isTotal: true,
                    ),
                  ),


                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: BlocConsumer<AddOrderCubit,AddOrderState>(
                      listener: (context,state){
                        if(state is AddOrderError)
                          {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => RequestFailure()),
                            );

                          }
                        if(state is AddOrderSuccess)
                          {

                            context.read<CartCubit>().clearCart();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                     RequestSuccessfullyExecuted(invoiceNumber: state.invoiceNumber,orderSummryModel:state.orderSummryModel ,)));
                          }

                      },
                      builder: (context,state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainAppColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                          ),
                          onPressed: () {

                            BlocProvider.of<AddOrderCubit>(context).addOrder
                              (
                                discountCode: 'discountCodeController.text',
                                regionName:selectAddress?.regionName??'',
                                customerAddress:selectAddress?.addressNotes3??'' ,
                                customName:selectAddress?.arabicName??'' ,
                                districtName:selectAddress?.districtName2??'' ,
                                email:selectAddress?.email??'' ,
                                listItem:cartItems?.cartItems ,
                                total: cartItems?.calculateTotalPrice()??0,
                                addition:0,
                                discount:0.0
                            ,
                              deliveryDate: deliveryDate,
                              deliveryId: deliveryId,
                              deliveryTime: deliveryTime

                            );
                            
                          },
                          child: ConditionalBuilder(

                            condition: state is !AddOrderLoading,
                            builder:
                            (context)
                              {
                                return   Text("payment".tr(),
                                    style:
                                    TextStyle(fontSize: 16.sp, color: Colors.white));
                              },

                              fallback: (context)
                            {
                            return const Center(child: CircularProgressIndicator(color: Colors.white,));
                            }

                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildRadioOption(
      String label,
      String value,
      String selectedValue,
      BuildContext context,
      ) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedValue,
          onChanged: (val) {
            if (val != null) {
              context.read<AddOrderCubit>().changeDeliveryTime(val);
            }
          },
          activeColor: AppColors.mainAppColor,
        ),
        Text(label, style: TextStyle(fontSize: 14.sp)),
      ],
    );
  }



}

class TimeSlotComponent extends StatelessWidget {
  TimeSlotComponent(
      {super.key, required this.addOrderCubit, required this.index});

  AddOrderCubit addOrderCubit;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addOrderCubit.changeSelectedDeliveryTime(id: addOrderCubit.deliveryTimesList[index].id, index: index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: addOrderCubit.selectedDeliveryIndex==index ? AppColors.mainAppColor : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            '${DateFormat('hh:mm a').format(
              addOrderCubit.deliveryTimesList[index].startTime,
            )} \u00B7 ${DateFormat('hh:mm a').format(
              addOrderCubit.deliveryTimesList[index].endTime,
            )}',
            style: TextStyle(
              color: addOrderCubit.selectedDeliveryIndex==index ? Colors.white : Colors.black,
              fontSize: 10.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class SummaryRowComponent extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const SummaryRowComponent({
    Key? key,
    required this.label,
    required this.value,
    this.isTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
class DayLabel extends StatelessWidget {
  final String label;
  final String value;
  final bool selectedDay;
  final VoidCallback? onTap;

  const DayLabel({
    Key? key,
    required this.label,
    required this.value,
    required this.selectedDay,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.w,
        height: 37,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selectedDay? AppColors.mainAppColor : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selectedDay ? Colors.white : AppColors.mainAppColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
