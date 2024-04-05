import 'package:barber/constants/app_imports.dart';

class SearchScreen extends GetWidget<MySearchController> {
  const SearchScreen({super.key});

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
                Text(
                  controller.search,
                  style: AppFonts.fontHeavy20Petrol,
                ),
                Divider(
                  height: 50.sp,
                  color: AppColors.petrol,
                  indent: 100.w,
                  endIndent: 100.w,
                ),
                controller.barbersBasedOnSearch.length < 1
                    ? Text(
                        AppStrings.noBarbersFoundText,
                        style: AppFonts.fontHeavy18grey.copyWith(
                          color: AppColors.petrol,
                        ),
                      )
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.barbersBasedOnSearch.length,
                        itemBuilder: (BuildContext context, int index) {
                          BarberModel barber = controller.barbersBasedOnSearch[index];
                          return InkWell(
                            onTap: () => controller.barberItemOnClick(barber),
                            child: BarberCardWidget(
                              barber,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return GapWidget(10);
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
