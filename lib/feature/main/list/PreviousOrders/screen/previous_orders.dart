

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';


import '../../../../../core/constant/app_colors.dart';
import '../../presentation/screens/prevuis_order/screen/my_emty_previos_screen.dart';
import '../../presentation/screens/prevuis_order/screen/widget/build_current_order.dart';
import '../manager/previous_order_cubit.dart';
import '../manager/previous_order_state.dart';
import '../model/previous_order_model.dart';


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
        body: Column(
          children: [
            SizedBox(height: 30.h),
           Expanded(child: OrdersScreen()),
          ],
        ),
      ),
    );
  }
}
class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});


  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => PreviousOrderCubit()..getPreviousOrders()..getOrderTrackingDetails(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      selectedIndex.value = 1;
                    },
                    child: ValueListenableBuilder<int>(
                      valueListenable: selectedIndex,
                      builder: (context, value, _) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                            color: value == 1
                                ? const Color(0xffBA0B74)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Center(
                            child: Text(
                              "my_previous_orders".tr(),
                              style: TextStyle(
                                color: value == 1
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      selectedIndex.value = 0;
                    },
                    child: ValueListenableBuilder<int>(
                      valueListenable: selectedIndex,
                      builder: (context, value, _) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                            color: value == 0
                                ? AppColors.mainAppColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Center(
                            child: Text(
                              "my_current_orders".tr(),
                              style: TextStyle(
                                color: value == 0
                                    ? Colors.white
                                    : AppColors.mainAppColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, value, _) {
                return value == 0
                    ? const BuildCurrentOrder()
                    : const BuilPrevuisOrder();
              },
            ),
          ),
        ],
      ),
    );
  }
}










class BuilPrevuisOrder extends StatelessWidget {
  const BuilPrevuisOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Column(
          //       children: [
          //         Stack(
          //           children: [
          //             Container(
          //               width: 70,
          //               height: 70,
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: AppColors.backgroundAppColor,
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Colors.black.withOpacity(0.2),
          //                     blurRadius: 6,
          //                     offset: const Offset(0, 3),
          //                   ),
          //                 ],
          //               ),
          //               child: CircleAvatar(
          //                 radius: 35,
          //                 backgroundColor: AppColors.backgroundAppColor,
          //                 child: CircleAvatar(
          //                   radius: 30,
          //                   backgroundColor: AppColors.mainAppColor,
          //                   child: Center(
          //                     child: Text(
          //                       "1",
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 20.sp,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           height: 10.h,
          //         ),
          //         Text(
          //           "received".tr(),
          //           style: TextStyle(
          //             color: const Color(0xff23A20A),
          //             fontSize: 13.sp,
          //             fontWeight: FontWeight.w700,
          //           ),
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       width: 30.w,
          //     ),
          //     Column(
          //       children: [
          //         Stack(
          //           children: [
          //             Container(
          //               width: 70,
          //               height: 70,
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: AppColors.backgroundAppColor,
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Colors.black.withOpacity(0.2),
          //                     blurRadius: 6,
          //                     offset: const Offset(0, 3),
          //                   ),
          //                 ],
          //               ),
          //               child: CircleAvatar(
          //                 radius: 35,
          //                 backgroundColor: AppColors.backgroundAppColor,
          //                 child: CircleAvatar(
          //                   radius: 30,
          //                   backgroundColor: AppColors.mainAppColor,
          //                   child: Center(
          //                     child: Text(
          //                       "1",
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 20.sp,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           height: 10.h,
          //         ),
          //         Text(
          //           "cancelled".tr(),
          //           style: TextStyle(
          //             color: AppColors.mainAppColor,
          //             fontSize: 13.sp,
          //             fontWeight: FontWeight.w700,
          //           ),
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       width: 30.w,
          //     ),
          //     Column(
          //       children: [
          //         Stack(
          //           children: [
          //             Container(
          //               width: 70,
          //               height: 70,
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: AppColors.backgroundAppColor,
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Colors.black.withOpacity(0.2),
          //                     blurRadius: 6,
          //                     offset: const Offset(0, 3),
          //                   ),
          //                 ],
          //               ),
          //               child: CircleAvatar(
          //                 radius: 35,
          //                 backgroundColor: AppColors.backgroundAppColor,
          //                 child: CircleAvatar(
          //                   radius: 30,
          //                   backgroundColor: AppColors.mainAppColor,
          //                   child: Center(
          //                     child: Text(
          //                       "2",
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 20.sp,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           height: 10.h,
          //         ),
          //         Text(
          //           "cancelled".tr(),
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontSize: 13.sp,
          //             fontWeight: FontWeight.w700,
          //           ),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 15.h,
          // ),
          const MyOrdersListScreen()
        ],
      ),
    );
  }
}

class BuildCurrentOrder extends StatelessWidget {
  const BuildCurrentOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviousOrderCubit, PreviousOrderState>(
      builder: (context, state) {
        return StreamBuilder<List<PreviousOrdersModel>>(
          stream: BlocProvider.of<PreviousOrderCubit>(context).orderTrackingDetailsStream,
          builder: (context, snapshot) {


            if (snapshot.hasError) {
              return Center(child: Text("حدث خطأ: ${snapshot.error}"));
            }

            var orderTrackingDetails = snapshot.data ?? [];



            return
              orderTrackingDetails.isEmpty?
              const MyPreviousEmptyOrders()
                  :

              StepperPageView(
              orderTrackingCubit: BlocProvider.of<PreviousOrderCubit>(context),

            );
          },
        );
      },
    );
  }
}


class MyOrdersListScreen extends StatelessWidget {
  const MyOrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviousOrderCubit, PreviousOrderState>(
        builder: (context, state) {

        return

          BlocProvider.of<PreviousOrderCubit>(context).previousOrderList.isEmpty?
          const MyPreviousEmptyOrders()
              :

          ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: BlocProvider.of<PreviousOrderCubit>(context).previousOrderList.length,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 280.h,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Vectorrr.png",
                            fit: BoxFit.cover,
                            height: 230.h,
                          ),
                          Positioned(
                            top: 5,
                            left: 0,
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const InvoiceScreen()));
                              },
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/Rectangle 6438.png",
                                    width: 79.w,
                                    height: 49.h,
                                  ),
                                  Positioned(
                                    top: 12,
                                    left: 10,
                                    child: Text(
                                      "show".tr(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 13,
                                    right: 11,
                                    child:
                                    Image.asset("assets/images/Frame 11.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 8,
                            child: Row(
                              children: [
                                Text(
                                  "order_number".tr(),
                                  style: TextStyle(
                                    color: const Color(0xff231F20),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "${BlocProvider.of<PreviousOrderCubit>(context).previousOrderList[index].orderNo}",
                                  style: TextStyle(
                                    color: const Color(0xff231F20),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 30,
                            right: 8,
                            child: Row(
                              children: [
                                Text(
                                  "order_history".tr(),
                                  style: TextStyle(
                                    color: const Color(0xff231F20),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(DateFormat('dd/MM/yyyy','en')
                                    .format(BlocProvider.of<PreviousOrderCubit>(context).previousOrderList[index].orderDate)
                                  ,
                                  style: TextStyle(
                                    color: const Color(0xff231F20),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 80,
                            right: 8,
                            width: 320.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "delivery_address".tr(),
                                      style: TextStyle(
                                        color: const Color(0xff231F20),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Text(
                                        BlocProvider.of<PreviousOrderCubit>(context).previousOrderList[index].orderAddress
                                            .tr(),
                                        style: TextStyle(
                                          color: const Color(0xff231F20),
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 23.h),
                                Divider(color: Colors.grey.withOpacity(0.5)),
                                SizedBox(height: 10.h),
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text(
                                //       "order_status".tr(),
                                //       style: TextStyle(
                                //         color: const Color(0xff231F20),
                                //         fontSize: 13.sp,
                                //         fontWeight: FontWeight.w400,
                                //       ),
                                //     ),
                                //     SizedBox(width: 20.w),
                                //     Text(
                                //       "it_has_been_canceled.".tr(),
                                //       style: TextStyle(
                                //         color: const Color(0xffFF0909),
                                //         fontSize: 16.sp,
                                //         fontWeight: FontWeight.w400,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 17,
                      right: 15,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundAppColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "total_price:".tr(),
                              style: TextStyle(
                                color: const Color(0xff231F20),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${BlocProvider.of<PreviousOrderCubit>(context).previousOrderList[index].finalValue} ${'pounds'.tr()}"

                              ,style: TextStyle(
                                color: AppColors.mainAppColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    );
  }
}














