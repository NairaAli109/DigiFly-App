import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/core/widgets/profile_side_text.dart';
import 'package:digifly_task/core/widgets/user_name_text.dart';
import 'package:digifly_task/core/widgets/user_profile_image.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
          const UserProfileImage(raduis: 20,),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserNameText(fontSize: 12),
                ProfileSideText(text: 'welcome',)
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.veryLightGreyColor,
                child: Image.asset(
                  Assets.imagesFavIcon,
                  width: 20.w,
                  height: 15.26.h,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.veryLightGreyColor,
                child: Image.asset(
                  Assets.imagesNotificationsIcon,
                  width: 20.w,
                  height: 15.26.h,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
