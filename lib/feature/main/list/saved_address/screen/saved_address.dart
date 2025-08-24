import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/list/presentation/screens/edite_adress.dart';
import 'package:settings_app/feature/main/list/saved_address/manager/saved_address_state.dart';
import 'package:settings_app/feature/main/list/saved_address/manager/saved_sddress_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../model/all_address_model.dart';

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
            SizedBox(
              height: 30.h,
            ),
            BlocBuilder<SavedAddressCubit,SavedAddressState>(

                builder: (context,state) {
                  return Expanded(
                      child:
                      ConditionalBuilder
                        (condition: state is !GetGAllAddressSuccess,
                          builder: (context){

                            return ListView.builder(
                              itemCount: context.read<SavedAddressCubit>().allAddressList.length,
                              itemBuilder: (context, index) {
                                AllAddressModel address=context.read<SavedAddressCubit>().allAddressList[index];
                                return
                                  AddressCard(
                                    title:  address.addressNotes!=null?address.addressNotes.toString():'',
                                    subtitle: address.mainAddress==1?'(main_title)'.tr():'',
                                    userName: '${address.arabicName??''} ${address.lastName??''}',
                                    phone: address.customerPhone??'',
                                    address: address.customerAddress??'',
                                    onEdit: () {
                                      //  BlocProvider.of<SavedAddressCubit>(context).getAllAddress();

                                      Navigator.push(context, MaterialPageRoute(builder: (_) => const EditeAddress()));
                                    },
                                    onDelete: () {
                                      if(address.mainAddress!=0)

                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('❌ لا يمكن حذف العنوان الأساسي'),
                                          ),
                                        );
                                      }
                                    },
                                  );

                                //   Padding(
                                //   padding:
                                //   const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                                //   child: Container(
                                //     height: 140.h,
                                //     width: 393.w,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10),
                                //       color: Colors.white,
                                //     ),
                                //     child: Column(
                                //       children: [
                                //         Padding(
                                //           padding: const EdgeInsets.only(right: 20, top: 10),
                                //           child: Row(
                                //             children: [
                                //               Text(
                                //                 "house".tr(),
                                //                 style: TextStyle(
                                //                   color: AppColors.mainAppColor,
                                //                   fontWeight: FontWeight.w500,
                                //                   fontSize: 12.sp,
                                //                 ),
                                //               ),
                                //               SizedBox(width: 10.w),
                                //               Text(
                                //                 "(main_title)".tr(),
                                //                 style: TextStyle(
                                //                   color: const Color(0xff231F20),
                                //                   fontWeight: FontWeight.w500,
                                //                   fontSize: 6.sp,
                                //                 ),
                                //               )
                                //             ],
                                //           ),
                                //         ),
                                //         SizedBox(height: 8.h),
                                //         Padding(
                                //           padding: const EdgeInsets.only(right: 5),
                                //           child: Row(
                                //             children: [
                                //               Image.asset(
                                //                   "assets/images/Layer_2_copy_11 (1).png"),
                                //               SizedBox(width: 5.w),
                                //               Text(
                                //                 "mohamed_samir".tr(),
                                //                 style: TextStyle(
                                //                   color: AppColors.mainAppColor,
                                //                   fontWeight: FontWeight.w400,
                                //                   fontSize: 12.sp,
                                //                 ),
                                //               ),
                                //               const Spacer(),
                                //               Row(
                                //                 children: [
                                //                   InkWell(
                                //                       onTap: () {
                                //                         Navigator.push(
                                //                             context,
                                //                             MaterialPageRoute(
                                //                                 builder: (context) =>
                                //                                 const EditeAddress()));
                                //                       },
                                //                       child: Image.asset(AppAssets.edite)),
                                //                   GestureDetector(
                                //                     onTap: () {
                                //                       showDialog(
                                //                         context: context,
                                //                         builder: (context) {
                                //                           return AlertDialog(
                                //                             contentPadding:
                                //                             const EdgeInsets.all(20),
                                //                             shape: RoundedRectangleBorder(
                                //                               borderRadius:
                                //                               BorderRadius.circular(12),
                                //                             ),
                                //                             content: Column(
                                //                               mainAxisSize: MainAxisSize.min,
                                //                               children: [
                                //                                 Image.asset(AppAssets.addres),
                                //                                 SizedBox(height: 10.h),
                                //                                 Text(
                                //                                   'delete_the_address'.tr(),
                                //                                   style: TextStyle(
                                //                                     color: AppColors
                                //                                         .mainAppColor,
                                //                                     fontWeight:
                                //                                     FontWeight.w500,
                                //                                     fontSize: 12.sp,
                                //                                   ),
                                //                                 ),
                                //                                 Text(
                                //                                   'are_you_sure_you_want_to_delete_this_address?'
                                //                                       .tr(),
                                //                                   style: TextStyle(
                                //                                     color: AppColors
                                //                                         .mainAppColor,
                                //                                     fontWeight:
                                //                                     FontWeight.w500,
                                //                                     fontSize: 10.sp,
                                //                                   ),
                                //                                 ),
                                //                                 SizedBox(height: 20.h),
                                //                                 Row(
                                //                                   mainAxisAlignment:
                                //                                   MainAxisAlignment
                                //                                       .center,
                                //                                   children: [
                                //                                     ElevatedButton(
                                //                                       onPressed: () {
                                //                                         Navigator.of(context)
                                //                                             .pop(); // Cancel
                                //                                       },
                                //                                       style: ElevatedButton
                                //                                           .styleFrom(
                                //                                           backgroundColor:
                                //                                           AppColors
                                //                                               .mainAppColor),
                                //                                       child: Text(
                                //                                         'delete'.tr(),
                                //                                         style: TextStyle(
                                //                                             fontSize: 15.sp,
                                //                                             fontWeight:
                                //                                             FontWeight
                                //                                                 .w500,
                                //                                             color:
                                //                                             Colors.white),
                                //                                       ),
                                //                                     ),
                                //                                     SizedBox(
                                //                                       width: 20.w,
                                //                                     ),
                                //                                     ElevatedButton(
                                //                                       onPressed: () {
                                //                                         Navigator.of(context)
                                //                                             .pop();
                                //                                       },
                                //                                       style: ElevatedButton
                                //                                           .styleFrom(
                                //                                           backgroundColor:
                                //                                           Colors
                                //                                               .white),
                                //                                       child: Text(
                                //                                         'cancel'.tr(),
                                //                                         style: TextStyle(
                                //                                             fontSize: 15.sp,
                                //                                             fontWeight:
                                //                                             FontWeight
                                //                                                 .w500,
                                //                                             color: AppColors
                                //                                                 .mainAppColor),
                                //                                       ),
                                //                                     ),
                                //                                   ],
                                //                                 )
                                //                               ],
                                //                             ),
                                //                           );
                                //                         },
                                //                       );
                                //                     },
                                //                     child: Icon(
                                //                       Icons.delete,
                                //                       color: AppColors.mainAppColor,
                                //                     ),
                                //                   ),
                                //                 ],
                                //               )
                                //             ],
                                //           ),
                                //         ),
                                //         SizedBox(height: 7.h),
                                //         Padding(
                                //           padding: const EdgeInsets.only(right: 5),
                                //           child: Row(
                                //             children: [
                                //               Image.asset("assets/images/Group (8).png"),
                                //               SizedBox(width: 5.w),
                                //               Text(
                                //                 "01096397289",
                                //                 style: TextStyle(
                                //                   color: const Color(0xff0A9223),
                                //                   fontWeight: FontWeight.w400,
                                //                   fontSize: 12.sp,
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //         SizedBox(height: 7.h),
                                //         Padding(
                                //           padding: const EdgeInsets.only(right: 5),
                                //           child: Row(
                                //             children: [
                                //               Icon(
                                //                 Icons.location_on,
                                //                 color: AppColors.mainAppColor,
                                //               ),
                                //               SizedBox(width: 5.w),
                                //               Expanded(
                                //                 child: Text(
                                //                   "mansoura_talkha_corner_of_agriculture_street_al-Maghazi_tower"
                                //                       .tr(),
                                //                   style: TextStyle(
                                //                     color: const Color(0xff231F20),
                                //                     fontWeight: FontWeight.w400,
                                //                     fontSize: 9.sp,
                                //                   ),
                                //                   maxLines: 2,
                                //                   overflow: TextOverflow.ellipsis,
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // );
                              },
                            );
                          },
                          fallback:(context){
                            return Skeletonizer(
                              enabled: true,
                              child: AddressCard(
                                title: 'house'.tr(),
                                subtitle: '(main_title)'.tr(),
                                userName: 'mohamed_samir'.tr(),
                                phone: '01096397289',
                                address: 'mansoura_talkha_corner_of_agriculture_street_al-Maghazi_tower'.tr(),
                                onEdit: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => const EditeAddress()));
                                },
                                onDelete: () {

                                },
                              ),
                            );

                          })

                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}





class AddressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String userName;
  final String phone;
  final String address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const AddressCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.userName,
    required this.phone,
    required this.address,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
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
                    title,
                    style: TextStyle(
                      color: AppColors.mainAppColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: const Color(0xff231F20),
                      fontWeight: FontWeight.w500,
                      fontSize: 6.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                children: [
                  Image.asset("assets/images/Layer_2_copy_11 (1).png"),
                  SizedBox(width: 5.w),
                  Text(
                    userName,
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
                        onTap: onEdit,
                        child: Image.asset(AppAssets.edite),
                      ),
                      GestureDetector(
                        onTap: () => _showDeleteDialog(context),
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
                    phone,
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
                      address,
                      style: TextStyle(
                        color: const Color(0xff231F20),
                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp,
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
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.addres),
              SizedBox(height: 10.h),
              Text(
                'delete_the_address'.tr(),
                style: TextStyle(
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'are_you_sure_you_want_to_delete_this_address?'.tr(),
                style: TextStyle(
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onDelete(); // Call the callback
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainAppColor),
                    child: Text(
                      'delete'.tr(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white),
                    child: Text(
                      'cancel'.tr(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainAppColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
