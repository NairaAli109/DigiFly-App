import 'package:digifly_task/features/profile/profile_view.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({super.key, required this.raduis});

  final double raduis;

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pushNamed(ProfileView.id);
          },
          icon: CircleAvatar(
            radius: raduis.r,
            backgroundColor: Colors.transparent,
            child: firebaseUser != null
                ? ClipOval(
                   child: Image.network(
                     firebaseUser.photoURL!,
                     width: raduis * 2,
                     height: raduis * 2,
                     fit: BoxFit.cover,
                   ),
                  )
                :  ClipOval(
              child: Image.asset(
               Assets.imagesProfile,
                width: raduis * 2,
                height: raduis * 2,
                fit: BoxFit.contain,
              ),
            )
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
