
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../manager/about_us_cubit.dart';
import '../manager/about_us_state.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
          "who_are_we?".tr(),
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
        create: (context)=>AboutUsCubit()..getImageAboutUs(),

        child: BlocBuilder<AboutUsCubit,AboutUsState>(
          builder: (context,state)
          {
            AboutUsCubit aboutUsCubit =BlocProvider.of<AboutUsCubit>(context);
            return  ConditionalBuilder(
              builder: (context) {
                return ListView.builder(
                  itemCount: aboutUsCubit.aboutUsList.length,
                  itemBuilder: (context, index) {
                    return
                      CachedNetworkImage(
                        imageUrl: aboutUsCubit.aboutUsList[index].imagePath??'',
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
              condition: (state is !GetImageAboutUsLoading||state is !GetImageAboutUsError||aboutUsCubit.aboutUsList.isNotEmpty),

            );
          },

        ),
      ),
    );
  }
}
