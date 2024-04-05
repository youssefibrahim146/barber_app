import 'package:barber/constants/app_imports.dart';

class BarberDetailsScreen extends GetWidget<BarberDetailsController> {
  const BarberDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.petrol,
      floatingActionButton: Container(
        height: 50.sp,
        width: 50.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: AppColors.petrol,
        ),
        child: InkWell(
          onTap: controller.phoneButtonOnClick,
          child: Icon(
            Icons.phone,
            color: AppColors.white,
            size: 24.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.sp),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 360.sp,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Hero(
                        tag: controller.barber.image + controller.barber.name,
                        child: Card(
                          elevation: 0.sp,
                          margin: EdgeInsets.all(0.sp),
                          color: AppColors.transparent,
                          child: Container(
                            height: 360.sp,
                            width: double.infinity,
                            child: CachedNetworkImageWidget(
                              imageUrl: controller.barber.image,
                              placeholderColor: AppColors.petrol,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: CircleAvatar(
                          radius: 20.sp,
                          backgroundColor: AppColors.white,
                          child: InkWell(
                            onTap: Get.back,
                            child: Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: AppColors.petrol,
                              size: 30.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.sp,
                  ),
                  child: Column(
                    children: [
                      BarberDetailsTitlesWidget(
                        AppStrings.barberNameText,
                        barber: controller.barber,
                      ),
                      BarberDetailsTitlesWidget(
                        AppStrings.priceText,
                        subTitle: Text(
                          AppStrings.priceText,
                          style: AppFonts.fontHeavy16White.copyWith(
                            color: AppColors.petrol,
                          ),
                        ),
                      ),
                      BarberDetailsTitlesWidget(
                        AppStrings.offersText,
                        subTitle: Text(
                          AppStrings.offersText,
                          style: AppFonts.fontHeavy16White.copyWith(
                            color: AppColors.petrol,
                          ),
                        ),
                      ),
                      BarberDetailsTitlesWidget(
                        AppStrings.setDayText,
                        subTitle: Text(
                          AppStrings.setDayText,
                          style: AppFonts.fontHeavy16White.copyWith(
                            color: AppColors.petrol,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
