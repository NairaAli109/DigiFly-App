import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key});

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.h,
      right: 16.h,
      child: IconButton(
          onPressed: () {},
          icon: Image.asset(
            Assets.imagesProductFavIcon,
            width: 24.w,
            height: 20.h,
          )),
    );
  }
}
