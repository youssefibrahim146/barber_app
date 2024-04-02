import '../../constants/app_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.sp),
        child: Column(
          children: [
            const HomeAppBar(),
            const SpaceTap(size: 40),
            Row(
              children: [
                const Expanded(
                  child: HomeSearchBar(),
                ),
                const SpaceTap(size: 21),
                Container(
                  padding: EdgeInsets.all(14.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.sp),
                    color: AppColors.petrolColor,
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                    size: 35.sp,
                  ),
                ),
              ],
            ),
            const SpaceTap(size: 29),
            Divider(
              color: AppColors.petrolColor,
              thickness: 5.sp,
            ),
            const SpaceTap(size: 24),
            const BarberCard(),
          ],
        ),
      ),
    );
  }
}
