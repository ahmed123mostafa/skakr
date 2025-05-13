import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/list/presentation/screens/edite_adress.dart';

class SavedAddress extends StatelessWidget {
  const SavedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.5),
          centerTitle: true,
          title: Row(
            children: [
              Image.asset(
                AppAssets.addres,
                width: 17,
                height: 20,
              ),
              SizedBox(
                width: 7.w,
              ),
              Text(
                "saved_addresses".tr(),
                style: TextStyle(
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          leading: Icon(
            Icons.arrow_back,
            color: AppColors.mainAppColor,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                    child: Container(
                      height: 140.h,
                      width: 393.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "house".tr(),
                                  style: TextStyle(
                                    color: AppColors.mainAppColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "(main_title)".tr(),
                                  style: TextStyle(
                                    color: const Color(0xff231F20),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 6.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                Image.asset(
                                    "assets/images/Layer_2_copy_11 (1).png"),
                                SizedBox(width: 5.w),
                                Text(
                                  "Mohamed Said",
                                  style: TextStyle(
                                    color: AppColors.mainAppColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                   const    EditeAddress()));
                                        },
                                        child: Image.asset(AppAssets.edite)),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(AppAssets.addres),
                                                  SizedBox(height: 10.h),
                                                  Text(
                                                    'حذف العنوان',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .mainAppColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    'هل أنت متاكد من حذف هذا العنوان؟',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .mainAppColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(); // Cancel
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    AppColors
                                                                        .mainAppColor),
                                                        child: Text(
                                                          'تأكيد',
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 20.w,
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white),
                                                        child: Text(
                                                          'إلغاء',
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .mainAppColor),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: AppColors.mainAppColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 7.h),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                Image.asset("assets/images/Group (8).png"),
                                SizedBox(width: 5.w),
                                Text(
                                  "01096397289",
                                  style: TextStyle(
                                    color: const Color(0xff0A9223),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 7.h),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.mainAppColor,
                                ),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: Text(
                                    "المنصوره - طلخا - برج المغازي   "
                                    "الدور العاشر شقة2",
                                    style: TextStyle(
                                      color: const Color(0xff231F20),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
