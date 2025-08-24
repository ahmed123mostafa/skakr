import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/core/constant/custom_bottom.dart';
import 'package:settings_app/core/constant/custom_text_field.dart';

import '../../../../../core/constant/custom_dialog.dart';
import '../../../home/manager/cubit/home_cubit.dart';
import '../../../list/saved_address/manager/saved_address_state.dart';
import '../../../list/saved_address/manager/saved_sddress_cubit.dart';

class NewAddAddress extends StatelessWidget {
  NewAddAddress({super.key});

  final TextEditingController labelController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController deliveryController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



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
                "add a new address".tr(),
                style: TextStyle(
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.mainAppColor,
                ),
              ),
            ),
            body: BlocProvider(
              create: (context) => SavedAddressCubit()
                ..getGovernorates()
                ..getArea(),
              child: BlocConsumer<SavedAddressCubit, SavedAddressState>(
                listener: (context, state) {
                  if (state is AddNewAddressSuccess) {
                    if (state.data.contains("This customer doesn't exist.")) {
                      customDialog(
                        title: 'address_not_added'.tr(),
                        context: context,
                      );

                      //  context.go('/home');

                      // navigatofinsh(context, HomeScreen(), false);
                    } else {
                      //showCustomSnackBar(context,'address_added_successfully'.tr(),);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      // if(!isSavedAddressPage)
                      // {
                      // Navigator.pop(context);
                      // BlocProvider.of<HomeCubit>(context).changeSelectIndexBottom(index: 2);
                      // }
                    }
                  }

                  if (state is AddNewAddressError) {
                    customDialog(
                      title: 'address_not_added'.tr(),
                      context: context,
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = BlocProvider.of<SavedAddressCubit>(context);
                  return SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextFormField(
                              controller: labelController,
                              hintFontSize: 10,
                              validator: (value) => value!.isEmpty
                                  ? "please_enter_address_type".tr()
                                  : null,
                              hintText:
                                  "name_the_title_(House-Apartment-Office)"
                                      .tr(),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: 223.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: AppColors.mainAppColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/Group 186 (1).png"),
                                SizedBox(width: 10.w),
                                Text(
                                  "delivery address".tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: BlocBuilder<SavedAddressCubit, SavedAddressState>(
                              builder: (context, state) {


                                return GestureDetector(
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        content: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: cubit.governoratesList
                                                .map(
                                                  (governorate) => ListTile(
                                                title: Center(
                                                  child: Text(
                                                    context.locale.languageCode == 'ar'
                                                        ? governorate.governorateName
                                                        : governorate.governorateEName,
                                                  ),
                                                ),
                                                onTap: () {
                                                  cubit.updateSelectedGovernorate(governorate);

                                                  Navigator.pop(context);
                                                },
                                              ),
                                            )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffEEEEEE),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            cubit.selectedGovernorate == null
                                                ? "governorate".tr()
                                                : (context.locale.languageCode == 'ar'
                                                ? cubit.selectedGovernorate!.governorateName
                                                : cubit.selectedGovernorate!.governorateEName),
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: const Color(0xff231F20),
                                            ),
                                          ),
                                        ),
                                        Image.asset("assets/images/Polygon 11.png"),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 10.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: BlocBuilder<SavedAddressCubit, SavedAddressState>(
                          builder: (context, state) {



                            return GestureDetector(
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: cubit.areaModelList
                                            .toSet()
                                            .map(
                                              (area) => ListTile(
                                            title: Center(
                                              child: Text(
                                                context.locale.languageCode == 'ar'
                                                    ? area.districtName ?? ""
                                                    : area.districtEName ?? "",
                                              ),
                                            ),
                                            onTap: () {
                                              cubit.updateSelectedArea(area);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffEEEEEE),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            cubit.areaModel == null
                                                ? "select_area".tr()
                                                : (context.locale.languageCode == 'ar'
                                                ? cubit.areaModel!.districtName ?? ""
                                                : cubit.areaModel!.districtEName ?? ""),
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: const Color(0xff231F20),
                                            ),
                                          ),
                                        ),
                                        Image.asset("assets/images/Polygon 11.png"),

                                      ],
                                    ),
                                  ),
                            );
                              },
                            ),
                          ),


// باقي الحقول (area, building, floor, apartment, delivery) تبقى مثل السابق مع controller و validator

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextFormField(
                              controller: buildingController,
                              hintFontSize: 10,
                              validator: (value) => value!.isEmpty
                                  ? "please_enter_building_name_or_number".tr()
                                  : null,
                              hintText:
                                  "name/number_of_the_building_(apartment-tower-villa)"
                                      .tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextFormField(
                              controller: floorController,
                              hintFontSize: 10,
                              textInputType: TextInputType.number,
                              validator: (value) => value!.isEmpty
                                  ? "please_enter_floor_number".tr()
                                  : null,
                              hintText: "floor".tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextFormField(
                              controller: apartmentController,
                              hintFontSize: 10,
                              textInputType: TextInputType.number,
                              validator: (value) => value!.isEmpty
                                  ? "please_enter_apartment_or_villa_number"
                                      .tr()
                                  : null,
                              hintText: "apartment/villa_number".tr(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextFormField(
                              controller: deliveryController,
                              hintFontSize: 10,
                              maxLines: 5,
                              validator: (value) => value!.isEmpty
                                  ? "please_enter_delivery_instructions".tr()
                                  : null,
                              hintText: "delivery_instructions".tr(),
                            ),
                          ),

                          SizedBox(height: 40.h),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: CustomButton(
                                width: 386.w,
                                height: 45.h,
                                text: "add address".tr(),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.addNewAddress
                                         (nameAddress: labelController.text,
                                           detailsAddress: deliveryController.text,
                                           districtName: cubit.areaModel?.districtName??'',
                                           regionName: cubit.selectedGovernorate?.governorateName);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
  }
}
