import 'package:barber/constants/app_imports.dart';

List<Widget> ReservationsBottomSheetWidgets(
  String barberName, {
  required VoidCallback locationOnClick,
  required VoidCallback phoneOnClick,
  required String barberImage,
  required String date,
}) {
  return [
    Text(
      AppStrings.reservationText,
      textAlign: TextAlign.center,
      style: AppFonts.fontHeavy20Petrol.copyWith(
        color: AppColors.white,
      ),
    ),
    GapWidget(15),
    barberImage == AppStrings.emptySign
        ? Text("data")
        : Container(
            width: double.infinity,
            padding: EdgeInsets.all(5.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250.sp,
                  width: 250.sp,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: 250.sp,
                        width: 250.sp,
                        child: CachedNetworkImageWidget(
                          imageUrl: barberImage,
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
                                onTap: locationOnClick,
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
                                onTap: phoneOnClick,
                                child: Icon(
                                  Icons.phone,
                                  color: AppColors.petrol,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GapWidget(10),
                Text(
                  barberName,
                  style: AppFonts.fontHeavy25White,
                ),
                Text(
                  date,
                  style: AppFonts.fontHeavy16White.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
  ];
}
