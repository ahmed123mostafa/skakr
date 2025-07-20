import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:settings_app/core/constant/app_colors.dart';

import '../../manager/cubit/home_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
class CustomMarque extends StatelessWidget {
  const CustomMarque({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:          BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<HomeCubit>(context);
          return ConditionalBuilder(
            condition: cubit.newsMarqueeList.isNotEmpty,
            builder: (context) => Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Marquee(
                text: cubit.newsMarqueeList.map((e) => e.newsText).join("      "),
                style: TextStyle(
                  color: AppColors.mainAppColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                blankSpace: 50.0,
                velocity: 40.0,
                pauseAfterRound: const Duration(seconds: 0),
                startPadding: 10.0,
                accelerationDuration: const Duration(seconds: 1),
                decelerationDuration: const Duration(milliseconds: 500),
              ),
            ),
            fallback: (context) => const SizedBox.shrink(),
          );



        }
      ),
    );
  }
}
