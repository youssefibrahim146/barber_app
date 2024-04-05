import 'package:barber/constants/app_imports.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

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
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
          ),
          child: SingleChildScrollView(
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
                    SizedBox(
                      width: 250.w,
                      child: TextField(
                        controller: controller.searchController,
                        cursorColor: AppColors.petrol,
                        onTapOutside: (PointerDownEvent event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        style: AppFonts.fontHeavy16White,
                        onSubmitted: (String value) => controller.searchOnClick(),
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          fillColor: AppColors.petrol,
                          filled: true,
                          prefixIcon: InkWell(
                            onTap: controller.searchOnClick,
                            child: Icon(
                              Icons.search,
                              color: AppColors.white,
                            ),
                          ),
                          hintText: "Search here...",
                          hintStyle: AppFonts.fontLight14grey.copyWith(
                            color: AppColors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(
                              color: AppColors.petrol,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(
                              color: AppColors.petrol,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(
                              color: AppColors.petrol,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(
                              color: AppColors.petrol,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                FutureBuilder<List<BarberModel>>(
                  future: controller.fetchBarbersData(),
                  builder: (BuildContext context, AsyncSnapshot<List<BarberModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return AppShimmers.homeBarberItemShimmer();
                    } else if (snapshot.hasError) {
                      return Icon(
                        Icons.error_outline,
                        color: AppColors.petrol,
                        size: 50.sp,
                      );
                    } else {
                      List<BarberModel> barbers = snapshot.data!;
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: barbers.length,
                        itemBuilder: (BuildContext context, int index) {
                          BarberModel barber = barbers[index];
                          return InkWell(
                            onTap: () => controller.barberOnClick(barber),
                            child: BarberCardWidget(barber),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return GapWidget(10);
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
