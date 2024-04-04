import 'package:barber/constants/app_imports.dart';

class AppShimmers {
  static Widget homeAppBarShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.petrol,
      highlightColor: AppColors.white,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.petrol,
            radius: 25.sp,
          ),
          const GapWidget(15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.welcomeText, style: AppFonts.fontLight14grey),
              const GapWidget(3),
              Container(
                width: 150.sp,
                height: 10.sp,
                decoration: BoxDecoration(
                  color: AppColors.petrol,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
