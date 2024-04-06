import 'package:barber/constants/app_imports.dart';
import 'package:intl/intl.dart';

List<Widget> ReservationsBottomSheetWidgets(List<ReservationModel> reservations) {
  return [
    Text(
      AppStrings.reservationsText,
      textAlign: TextAlign.center,
      style: AppFonts.fontHeavy20Petrol,
    ),
    GapWidget(25),
    ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: 10.sp,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reservations.length,
      itemBuilder: (BuildContext context, int index) {
        ReservationModel reservation = reservations[index];
        return Card(
          color: AppColors.petrol,
          elevation: 10.sp,
          child: Container(
            width: double.infinity,
            height: 65.h,
            padding: EdgeInsets.all(5.sp),
            child: Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.sp,
                      child: ClipOval(
                        child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: CachedNetworkImageWidget(
                            imageUrl: reservation.barberImage,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GapWidget(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reservation.barberName,
                      style: AppFonts.fontHeavy18grey.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      DateFormat(AppStrings.dateFormat).format(reservation.date),
                      style: AppFonts.fontHeavy16White.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return GapWidget(10);
      },
    ),
  ];
}
