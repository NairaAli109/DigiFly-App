import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerText extends StatelessWidget {
  const CustomShimmerText({super.key, required this.width});

  final int width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: width.w,
            height: 10.h,
            color: Colors.grey.shade300,
          ),
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}
