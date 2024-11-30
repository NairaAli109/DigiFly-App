// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/core/shared_pref/shared_pref.dart';
import 'package:digifly_task/core/widgets/user_profile_image.dart';
import 'package:digifly_task/features/auth/login/login_view.dart';
import 'package:digifly_task/features/profile/profile_view.dart';
import 'package:digifly_task/features/setting/widgets/email_text.dart';
import 'package:digifly_task/features/setting/widgets/setting_header_text.dart';
import 'package:digifly_task/features/setting/widgets/setting_item.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/user_name_text.dart';

class SettingView extends StatefulWidget {
  static const String id = "/setting";

  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "setting".tr,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 16.w, end: 16.w, top: 24.h, bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  UserProfileImage(raduis: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserNameText(fontSize: 14),
                      EmailText(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SettingHeaderText(headerText: 'setting'),
                  SizedBox(height: 24.h),
                  SettingItem(
                    icon: Assets.imagesProfile,
                    text: 'profile',
                    onTap: () {
                      context.pushNamed(ProfileView.id);
                    },
                    isArrowBack: true,
                    isLangButton: false,
                  ),
                  SettingItem(
                    icon: Assets.imagesLanguageIcon,
                    text: 'language',
                    onTap: () {
                      if (Get.locale == const Locale("ar")) {
                        setState(() {
                          Get.updateLocale(const Locale('en'));
                          SharedPref().saveLanguageCode('en');
                          print(Get.locale);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Language translated successfully to English")),
                          );
                        });
                      } else if (Get.locale == const Locale("en")) {
                        setState(() {
                          Get.updateLocale(const Locale('ar'));
                          SharedPref().saveLanguageCode('ar');
                          print(Get.locale);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "تم تغيير اللغه الي اللغه العربيه بنجاح")),
                          );
                        });
                      }
                    },
                    isArrowBack: true,
                    isLangButton: true,
                  ),
                  SizedBox(height: 40.h),
                  const SettingHeaderText(headerText: 'contact_us'),
                  SizedBox(height: 24.h),
                  SettingItem(
                    icon: Assets.imagesContact,
                    text: 'call_us',
                    onTap: () {},
                    isArrowBack: true,
                    isLangButton: false,
                  ),
                  SettingItem(
                    icon: Assets.imagesExclamation,
                    text: 'about_us',
                    onTap: () {},
                    isArrowBack: true,
                    isLangButton: false,
                  ),
                  SettingItem(
                    icon: Assets.imagesSignOut,
                    text: 'logout',
                    onTap: () async {
                      await SharedPref().logOut();
                      if (await SharedPref().logOut()) {
                        context.pushReplacementNamed(LoginView.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text("Logout_Successfully".tr)),
                        );
                      }
                    },
                    isArrowBack: false,
                    isLangButton: false,
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
