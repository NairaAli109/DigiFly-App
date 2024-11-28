// ignore_for_file: avoid_print

import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/core/widgets/profile_side_text.dart';
import 'package:digifly_task/core/widgets/user_profile_image.dart';
import 'package:digifly_task/features/auth/login/login_view.dart';
import 'package:digifly_task/features/profile/profile_view.dart';
import 'package:digifly_task/features/setting/widgets/setting_header_text.dart';
import 'package:digifly_task/features/setting/widgets/setting_item.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/user_name_text.dart';

class SettingView extends StatefulWidget {
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
                      ProfileSideText(text: 'ahmed.alaa123@gmail.com')
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
                          print(Get.locale);
                        });
                      } else if (Get.locale == const Locale("en")) {
                        setState(() {
                          Get.updateLocale(const Locale('ar'));
                          print(Get.locale);
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
                    onTap: () {
                      context.pushReplacementNamed(LoginView.id);
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
