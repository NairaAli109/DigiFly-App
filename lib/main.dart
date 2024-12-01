import 'package:digifly_task/core/localization/translation.dart';
import 'package:digifly_task/core/routes/app_router.dart';
import 'package:digifly_task/core/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  ///for ensuring that SharedPreferences created
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ///create SharedPreferences instance
  await SharedPref().initSharedPref();

  String? savedLanguageCode = SharedPref().getLanguageCode();
  Locale initialLocale = savedLanguageCode != null
      ? Locale(savedLanguageCode)
      : const Locale("en");

  runApp(MyApp(
    initialLocale: initialLocale,
  ));
}

class MyApp extends StatelessWidget {
  final Locale? initialLocale;

  const MyApp({super.key, this.initialLocale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp.router(
          routeInformationParser: AppRouter.goRouter.routeInformationParser,
          routerDelegate: AppRouter.goRouter.routerDelegate,
          routeInformationProvider: AppRouter.goRouter.routeInformationProvider,
          translations: AppTranslation(),
          locale: initialLocale,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
