import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/core/widgets/profile_side_text.dart';
import 'package:digifly_task/features/home/services/get_user_data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_shimmer_text.dart';

class EmailText extends StatelessWidget {
  const EmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: GetUserDataServices.getUserEmail(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomShimmerText(width: 200);
        } else if (snapshot.hasData && snapshot.data != null) {
          return Text(
            snapshot.data!,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGreyColor),
          );
        } else {
          return const ProfileSideText(text: 'user');
        }
      },
    );
  }
}
