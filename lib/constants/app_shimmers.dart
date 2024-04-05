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

  static Widget homeBarberItemShimmer() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.sp),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.sp, 4.sp),
                color: Colors.black.withOpacity(0.25),
                blurRadius: 9.sp,
                spreadRadius: 0.0.sp,
              ),
            ],
          ),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: AppColors.petrol,
                highlightColor: AppColors.white,
                child: Container(
                  height: double.infinity,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                ),
              ),
              GapWidget(10),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.sp,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: AppColors.petrol,
                      highlightColor: AppColors.white,
                      child: Container(
                        height: 10.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                      ),
                    ),
                    GapWidget(10),
                    Shimmer.fromColors(
                      baseColor: AppColors.petrol,
                      highlightColor: AppColors.white,
                      child: Container(
                        height: 8.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return GapWidget(10);
      },
    );
  }
}
