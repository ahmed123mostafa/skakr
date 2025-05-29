import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/feature/intial/splash_screen.dart';
import 'package:settings_app/feature/main/home/manager/cubit/home_cubit.dart';
import 'package:device_preview/device_preview.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: false, 
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
            BlocProvider(create: (context) => HomeCubit()),
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
            ),
            home: const SplashScreen(), 
          ),
        );
      },
    );
  }
}
