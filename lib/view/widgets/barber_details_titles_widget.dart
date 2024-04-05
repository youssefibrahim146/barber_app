import 'package:barber/constants/app_imports.dart';

class BarberDetailsTitlesWidget extends StatelessWidget {
  final BarberModel? barber;
  final Widget? subTitle;
  final String title;

  const BarberDetailsTitlesWidget(
    this.title, {
    this.subTitle,
    this.barber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GapWidget(20),
        Row(
          children: [
            Text(
              title,
              style: AppFonts.fontHeavy16White.copyWith(
                color: AppColors.petrol,
              ),
            ),
          ],
        ),
        GapWidget(10),
        subTitle ??
            Hero(
              tag: barber!.name + barber!.image,
              child: Card(
                elevation: 0.sp,
                margin: EdgeInsets.all(0.sp),
                color: AppColors.transparent,
                child: Text(
                  barber!.name,
                  style: AppFonts.fontHeavy25White.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
        Divider(
          height: 25.sp,
          color: AppColors.petrol,
          thickness: 3.sp,
          indent: 25.w,
          endIndent: 25.w,
        ),
      ],
    );
  }
}
