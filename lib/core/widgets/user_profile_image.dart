import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({super.key, required this.raduis});

  final double raduis;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: raduis.r,
          child: Image.asset(
            Assets.imagesUserImage,
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
