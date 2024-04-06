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
                                onTap: Get.back,
                                child: Icon(
                                  Icons.keyboard_arrow_left_rounded,
                                  color: AppColors.petrol,
                                  size: 30.sp,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: AppColors.white,
                              child: InkWell(
                                onTap: controller.locationButtonOnClick,
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.petrol,
                                  size: 30.sp,
                                ),
                              ),
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
