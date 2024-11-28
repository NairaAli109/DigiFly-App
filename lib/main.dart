import 'package:digifly_task/core/localization/translation.dart';
import 'package:digifly_task/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return  GetMaterialApp.router(
          routeInformationParser: AppRouter.goRouter.routeInformationParser,
          routerDelegate: AppRouter.goRouter.routerDelegate,
          routeInformationProvider: AppRouter.goRouter.routeInformationProvider,
          translations: AppTranslation(),
          locale: Get.locale ?? const Locale("en"),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}