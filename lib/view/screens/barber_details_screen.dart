import 'package:barber/constants/app_imports.dart';
import 'package:intl/intl.dart';

class BarberDetailsScreen extends GetWidget<BarberDetailsController> {
  const BarberDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.petrol,
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
                    alignment: Alignment.topCenter,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: AppColors.white,
                              child: InkWell(
                                onTap: () => Get.offNamed(AppStrings.homeRoute),
                                child: Icon(
                                  Icons.keyboard_arrow_left_rounded,
                                  color: AppColors.petrol,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.sp,
                                  backgroundColor: AppColors.white,
                                  child: InkWell(
                                    onTap: controller.locationButtonOnClick,
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.petrol,
                                      size: 24.sp,
                                    ),
                                  ),
                                ),
                                GapWidget(10),
                                CircleAvatar(
                                  radius: 20.sp,
                                  backgroundColor: AppColors.white,
                                  child: InkWell(
                                    onTap: controller.phoneButtonOnClick,
                                    child: Icon(
                                      Icons.phone,
                                      color: AppColors.petrol,
                                      size: 24.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                        subTitle: controller.barber.prices.length < 1
                            ? Text(AppStrings.noPricesForThatBarberText)
                            : ListView.separated(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.barber.prices.length,
                                itemBuilder: (BuildContext context, int index) {
                                  String priceName = controller.barber.prices[index][AppStrings.barberPriceNameField];
                                  String pricePrice = controller.barber.prices[index][AppStrings.barberPricePriceField].toString() + AppStrings.spaceSign + AppStrings.eGPText;
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        priceName,
                                        style: AppFonts.fontHeavy16White.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        pricePrice,
                                        style: AppFonts.fontHeavy16White.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return GapWidget(10);
                                },
                              ),
                      ),
                      BarberDetailsTitlesWidget(
                        AppStrings.offersText,
                        subTitle: controller.barber.offers.length < 1
                            ? Text(AppStrings.noOffersForThatBarberText)
                            : ListView.separated(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.sp,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.barber.offers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  String offerName = controller.barber.offers[index][AppStrings.barberOfferNameField];
                                  String offerPrice = controller.barber.offers[index][AppStrings.barberOfferPriceField].toString() + AppStrings.spaceSign + AppStrings.eGPText;
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        offerName,
                                        style: AppFonts.fontHeavy16White.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        offerPrice,
                                        style: AppFonts.fontHeavy16White.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return GapWidget(10);
                                },
                              ),
                      ),
                      BarberDetailsTitlesWidget(
                        AppStrings.setDayText,
                        subTitle: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: AppColors.petrol,
                            ),
                          ),
                          padding: EdgeInsets.all(10.sp),
                          child: Column(
                            children: [
                              GridView.builder(
                                itemCount: controller.getFirstSevenDaysInCurrentMonth().length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.sp),
                                      border: Border.all(
                                        color: AppColors.black,
                                      ),
                                    ),
                                    child: Text(
                                      controller.getFirstSevenDaysInCurrentMonth()[index],
                                      style: AppFonts.fontHeavy17black.copyWith(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  );
                                },
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  crossAxisSpacing: 10.sp,
                                  mainAxisSpacing: 10.sp,
                                ),
                              ),
                              GapWidget(25),
                              GridView.builder(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp,
                                ),
                                itemCount: controller.getDaysInCurrentMonth(),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  int users = 0;
                                  for (Map<String, dynamic> dayMap in controller.barber.setDay) {
                                    if (dayMap[AppStrings.dateField] == (index + 1).toString() + DateFormat(AppStrings.monthYearFormat).format(controller.now)) {
                                      users = dayMap[AppStrings.usersField].length;
                                      break;
                                    }
                                  }
                                  return InkWell(
                                    onTap: users == 10 ? () => AppDefaults.defaultToast(AppStrings.thisDayIsFullToast) : () => controller.onDayClick((index + 1).toString()),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: users == 0
                                            ? AppColors.lightGrey
                                            : users < 10 && users != 0
                                                ? AppColors.green
                                                : AppColors.red,
                                        borderRadius: BorderRadius.circular(10.sp),
                                        border: Border.all(
                                          color: users == 0
                                              ? AppColors.black
                                              : users < 10 && users != 0
                                                  ? AppColors.green
                                                  : AppColors.red,
                                        ),
                                      ),
                                      child: Text(
                                        (index + 1).toString(),
                                        style: AppFonts.fontHeavy17black.copyWith(
                                          fontSize: 14.sp,
                                          color: users == 0 ? AppColors.black : AppColors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  crossAxisSpacing: 20.sp,
                                  mainAxisSpacing: 20.sp,
                                ),
                              ),
                            ],
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
