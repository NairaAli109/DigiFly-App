import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 116.23.w,
          height: 80.h,
          child: Image.asset(Assets.imagesLogo),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
