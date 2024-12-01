// ignore_for_file: avoid_print

import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/core/widgets/custom_shimmer_text.dart';
import 'package:digifly_task/features/home/services/get_user_data_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({super.key, required this.fontSize});

  final int fontSize;

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    return FutureBuilder<String?>(
      future: GetUserDataServices.getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomShimmerText(width: 100);
        } else if (snapshot.hasData && snapshot.data != null) {
          return Text(
            firebaseUser != null ? firebaseUser.displayName! : snapshot.data!,
            style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          );
        } else {
          print(snapshot.data);
          return Text(
            "user",
            style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.greyColor,
            ),
          );
        }
      },
    );
  }
}
