import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeList1 extends StatelessWidget {
  const HomeList1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 173.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                Image.asset(Assets.imagesHomeList1),
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemCount: 5,
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
