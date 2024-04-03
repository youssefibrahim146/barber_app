import 'package:barber/constants/app_imports.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.sp),
        child: Column(
          children: [
            const HomeAppBarWidget(),
            const GapWidget(40),
            Row(
              children: [
                const Expanded(
                  child: HomeSearchBarWidget(),
                ),
                const GapWidget(21),
                Container(
                  padding: EdgeInsets.all(14.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.sp),
                    color: AppColors.petrol,
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                    size: 35.sp,
                  ),
                ),
              ],
            ),
            const GapWidget(29),
            Divider(
              color: AppColors.petrol,
              thickness: 5.sp,
            ),
            const GapWidget(24),
            const BarberCardWidget(),
          ],
        ),
      ),
    );
  }
}
