// ignore_for_file: avoid_print

import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/features/home/services/home_services.dart';
import 'package:digifly_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({
    super.key,
    required this.product,
    required this.index,
  });

  final List product;
  final int index;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    final List product = widget.product;
    final int index = widget.index;

    return Positioned(
      top: 16.h,
      right: 16.h,
      child: IconButton(
          onPressed: () async {
            // قراءة الحالة الحالية من المنتج
            final newStatus = !product[index]['is_fav'];

            // تحديث الملف أولًا
            await HomeServices.updateIsFavStatus(index, newStatus);

            // تحديث واجهة المستخدم بعد التأكد من التعديل
            setState(() {
              product[index]['is_fav'] = newStatus;
            });
            print(newStatus);
            print(product[index]['is_fav']);
          },
          icon: product[index]['is_fav']
              ? Icon(
                  Icons.favorite,
                  color: AppColors.lightGreenColor,
                  size: 30.sp,
                )
              : Image.asset(
                  Assets.imagesProductFavIcon,
                  width: 24.w,
                  height: 20.h,
                )),
    );
  }
}
