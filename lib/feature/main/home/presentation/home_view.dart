import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:settings_app/core/constant/app_assets.dart';
import 'package:settings_app/core/constant/app_colors.dart';
import 'package:settings_app/feature/main/home/manager/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          backgroundColor: const Color(0xfff3f3f3),
          body: SafeArea(
            child: homeCubit.screen[homeCubit.currentIndex],
          ),
          bottomNavigationBar: SalomonBottomBar(
            backgroundColor: Colors.white,
            curve: Curves.easeOutQuint,
            currentIndex: homeCubit
                .currentIndex, // Using the current index from HomeCubit
            onTap: (index) {
              homeCubit.changeSelectIndexBottom(
                  index: index); // Trigger index change
            },
            items: [
              SalomonBottomBarItem(
                icon: Image.asset(AppAssets.main),
                title: Text('home'.tr()),
                selectedColor: AppColors.mainAppColor,
              ),
              SalomonBottomBarItem(
                icon: Image.asset(AppAssets.catagory),
                title: Text('categories'.tr()),
                selectedColor: AppColors.mainAppColor,
              ),
              SalomonBottomBarItem(
                icon: Image.asset(AppAssets.cart),
                title: Text('cart'.tr()),
                selectedColor: AppColors.mainAppColor,
              ),
              SalomonBottomBarItem(
                icon: Image.asset(AppAssets.favourite),
                title: Text('favorites'.tr()),
                selectedColor: AppColors.mainAppColor,
              ),
              SalomonBottomBarItem(
                icon: Image.asset(AppAssets.list),
                title: Text('menu'.tr()),
                selectedColor: AppColors.mainAppColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
