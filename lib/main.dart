import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:settings_app/core/services/bloc_observer.dart';
import 'package:settings_app/feature/auth/presentation/widget/custom_language.dart';
import 'package:settings_app/feature/intial/splash_screen.dart';
import 'package:settings_app/feature/main/favourite/manager/favorite_cubit.dart';
import 'package:settings_app/feature/main/home/manager/cubit/home_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:settings_app/feature/main/list/saved_address/manager/saved_sddress_cubit.dart' show SavedAddressCubit;

import 'core/api/dio_concumer.dart';
import 'core/api/encrupt.dart';
import 'core/api/end_point.dart';
import 'core/constant/conatant.dart';
import 'core/network/secure_storage.dart';
import 'feature/main/Search/manager/search_cubit.dart';
import 'feature/main/catagory/manager/category_cubit.dart';
import 'feature/main/menu/manager/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 Bloc.observer = MyBlocObserver();  await Hive.initFlutter();
  
  beasUrlCairoOrMa = await SecureStorageService.read("baseUrlCairoOrMa");
  privateKey = await SecureStorageService.read("privateKey");
  publicKey= await SecureStorageService.read("publicKey");
  sign = await SecureStorageService.read("sign");
  CustomerID = await SecureStorageService.read(SecureStorageService.token);
  customerPhone = await SecureStorageService.read(SecureStorageService.mobile);
  customerName = await SecureStorageService.read(SecureStorageService.name);
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
            BlocProvider(create: (context) => HomeCubit()..getNewsMarquee()..getBannerOneImage()..getBiggestDiscountProducts()..getNewProduct()..getBestSellers()..getBannerTwoImage()..getOfferOne()..getOfferTwo()..getOfferThree()..getOfferFour()..getOfferFive()),
            BlocProvider(create: (context) => SavedAddressCubit()..getAllAddress()..getGovernorates()),
            BlocProvider(
              create: (context)=>CategoryCubit()..getMainCategory(),
            ), BlocProvider(
              create: (context)=>CartCubit(),
            ),
            BlocProvider(
              create: (context)=>FavoriteCubit(),
            ),

        BlocProvider(
        create: (context)=>SearchCubit(),)


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
