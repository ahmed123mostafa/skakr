import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/services/bloc_observer.dart';
import 'package:settings_app/feature/auth/presentation/widget/custom_language.dart';
import 'package:settings_app/feature/intial/splash_screen.dart';
import 'package:settings_app/feature/main/home/manager/cubit/home_cubit.dart';
import 'package:device_preview/device_preview.dart';

import 'feature/main/catagory/manager/category_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: true, 
      builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translation',
        fallbackLocale: const Locale('ar'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeCubit()..getNewsMarquee()..getBannerOneImage()..getBiggestDiscountProducts()..getNewProduct()..getBestSellers()..getBannerTwoImage()),
            BlocProvider(
              create: (context)=>CategoryCubit()..getMainCategory(),
            ),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true, 
            builder: DevicePreview.appBuilder, 
            locale:context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            theme: ThemeData(
              fontFamily: 'Alexandria', 
              useMaterial3: false,
              
            ),
            navigatorKey: NavigationService.navigatorKey,
              scaffoldMessengerKey: NavigationService.scaffoldMessengerKey,
          
            home: const SplashScreen(),  
          ),
        );
      },
    );
  }
}
