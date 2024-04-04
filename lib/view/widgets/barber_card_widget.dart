import 'package:barber/constants/app_imports.dart';

class BarberCardWidget extends StatelessWidget {
  const BarberCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          Container(
            height: double.infinity,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.sp),
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
                Text(
                  "Shop Name",
                  style: AppFonts.fontHeavy17black,
                ),
                GapWidget(5),
                Text(
                  "+20 100 084 5943",
                  style: AppFonts.fontLight14grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
