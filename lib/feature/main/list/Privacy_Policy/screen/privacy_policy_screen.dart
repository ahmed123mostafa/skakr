
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../manager/privacy_policy_cubit.dart';
import '../manager/privacy_policy_state.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.5),
        centerTitle: true,
        title: Text(
          "policy_and_Privacy".tr(),
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
      body: 
      BlocProvider(
        create: (context)=>PrivacyPolicyCubit()..getImagePrivacyPolicy(),

        child: BlocBuilder<PrivacyPolicyCubit,PrivacyPolicyState>(
          builder: (context,state)
          {
            PrivacyPolicyCubit aboutUsCubit =BlocProvider.of<PrivacyPolicyCubit>(context);
            return  ConditionalBuilder(
              builder: (context) {
                return ListView.builder(
                  itemCount: aboutUsCubit.privacyPolicyList.length,
                  itemBuilder: (context, index) {
                    return
                      CachedNetworkImage(
                        imageUrl: aboutUsCubit.privacyPolicyList[index].imagePath??'',
                        placeholder: (context, url) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: 1.0,
                              color: AppColors.mainAppColor,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),

                      );


                  },
                );
              },
              fallback: (context) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
              condition: (state is !GetImagePrivacyPolicyLoading||state is !GetImagePrivacyPolicyError||aboutUsCubit.privacyPolicyList.isNotEmpty),

            );
          },

        ),
      ),
    );
  }
}
