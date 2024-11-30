import 'package:digifly_task/features/profile/profile_view.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({super.key, required this.raduis});

  final double raduis;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pushNamed(ProfileView.id);
          },
          icon: CircleAvatar(
            radius: raduis.r,
            child: Image.asset(
              Assets.imagesUserImage,
            ),
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
