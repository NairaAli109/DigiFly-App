import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/core/widgets/auth_custom_button.dart';
import 'package:digifly_task/core/widgets/auth_custom_text_field.dart';
import 'package:digifly_task/features/profile/widgets/profile_editing_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const String id = "/Profile";

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "edit_profile".tr,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 40.w, end: 40.w, top: 48.h, bottom: 28.h),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "email".tr,
                        style: TextStyle(
                            color: AppColors.darkGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      ProfileEditingEmail(
                          controller: emailController,
                          hintText: "ahmed.alaa123@gmail.com",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            return null;
                          }),
                      Text(
                        "first_name".tr,
                        style: TextStyle(
                            color: AppColors.darkGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      ProfileEditingEmail(
                          controller: emailController,
                          hintText: "ahmed_alaa".tr.split(RegExp(r'\s+'))[0],
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return null;
                          }),
                      Text(
                        "last_name".tr,
                        style: TextStyle(
                            color: AppColors.darkGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      ProfileEditingEmail(
                          controller: emailController,
                          hintText: "ahmed_alaa".tr.split(RegExp(r'\s+'))[1],
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return null;
                          }),
                    ],
                  ),
                )),
                AuthCustomButton(
                  onTap: () {},
                  text: 'save'.tr,
                ),
              ],
            )),
      ),
    );
  }
}
