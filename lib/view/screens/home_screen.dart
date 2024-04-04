import 'package:barber/constants/app_imports.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.petrol,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.sp),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            children: [
              GapWidget(25),
              InkWell(
                onTap: controller.appBarOnClick,
                child: Hero(
                  tag: AppStrings.appBarTag,
                  child: Card(
                    elevation: 0.sp,
                    margin: EdgeInsets.all(0.sp),
                    color: AppColors.transparent,
                    child: Obx(
                      () {
                        return HomeAppBarWidget(controller.isHome.value, controller);
                      },
                    ),
                  ),
                ),
              ),
              Divider(
                height: 50.sp,
                color: AppColors.petrol,
                indent: 100.w,
                endIndent: 100.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeSearchBarWidget(),
                  // const GapWidget(21),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.petrol,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.white,
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
              GapWidget(20),
              const BarberCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
