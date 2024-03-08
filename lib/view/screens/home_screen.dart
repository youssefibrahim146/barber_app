import 'package:barber/constants/app_colors.dart';
import 'package:barber/helpers/app_space.dart';
import 'package:barber/view/widgets/barber_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/homa_appbar.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().whiteColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.sp),
        child: Column(
          children: [
            const HomeAppBar(),
            const SpaceTap(size: 40),
            Row(
              children: [
                const Expanded(
                  child: HomeSearchBar(),
                ),
                const SpaceTap(size: 21),
                Container(
                  padding: EdgeInsets.all(14.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.sp),
                    color: AppColors().petrolColor,
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                    size: 35.sp,
                  ),
                ),
              ],
            ),
            const SpaceTap(size: 29),
            Divider(
              color: AppColors().petrolColor,
              thickness: 5.sp,
            ),
            const SpaceTap(size: 24),
            const BarberCard(),
          ],
        ),
      ),
    );
  }
}
