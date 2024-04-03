import 'package:barber/constants/app_imports.dart';

class BarberCardWidget extends StatelessWidget {
  const BarberCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 174.h,
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
            width: 140.w,
            height: 174.h,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.sp),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Beky Barber shop",
                    style: AppFonts.fontHeavy17black,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}