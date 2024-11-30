import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/core/widgets/auth_custom_button.dart';
import 'package:digifly_task/features/home/bottom_nav_bar.dart';
import 'package:digifly_task/features/profile/widgets/edit_profile_header_text.dart';
import 'package:digifly_task/features/profile/widgets/last_name_profile_edit.dart';
import 'package:digifly_task/features/profile/widgets/name_editing_field.dart';
import 'package:digifly_task/features/profile/widgets/emai_editing_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
                      const EditProfileHeaderText(text: 'email'),
                      SizedBox(height: 8.h),
                      EmailEditingField(emailController: emailController),
                      const EditProfileHeaderText(text: 'first_name'),
                      SizedBox(height: 8.h),
                      FirstNameEditingField(
                        nameController: firstNameController,
                      ),
                      const EditProfileHeaderText(text: 'last_name'),
                      SizedBox(height: 8.h),
                      LastNameEditingField(
                        nameController: lastNameController,
                      ),
                    ],
                  ),
                )),
                AuthCustomButton(
                  onTap: () {
                    context.pushNamed(BottomNavBar.id, extra: 0);
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text("edited_success".tr)),
                    );
                  },
                  text: 'save'.tr,
                ),
              ],
            )),
      ),
    );
  }
}
