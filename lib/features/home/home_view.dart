import 'package:digifly_task/core/colors/colors.dart';
import 'package:digifly_task/features/home/widgets/best_seller_header.dart';
import 'package:digifly_task/features/home/widgets/best_seller_list.dart';
import 'package:digifly_task/features/home/widgets/home_app_bar.dart';
import 'package:digifly_task/features/home/widgets/home_list_1.dart';
import 'package:digifly_task/features/home/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightWhiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.w, end: 16.w, bottom: 19.h, top: 12.h),
            child: Column(
              children: [
                const HomeAppBar(),
                SearchField(),
                const HomeList1(),
                const BestSellerHeader(),
                SizedBox(height: 16.h),
                const BestSellerList(),
              ],
            )),
      )),
    );
  }
}
