import 'package:barber/constants/app_imports.dart';

class HomeAppBarWidget extends StatelessWidget {
  final HomeController controller;

  const HomeAppBarWidget(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: controller.fetchUserData(),
      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppShimmers.homeAppBarShimmer();
        } else if (snapshot.hasError) {
          return Icon(
            Icons.error_outline,
            color: AppColors.petrol,
            size: 50.sp,
          );
        } else {
          return Obx(
            () {
              UserModel? user = snapshot.data;
              return Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.petrol,
                    radius: 25.sp,
                    child: CachedNetworkImageWidget(
                      imageUrl: user!.image.value,
                      borderRadius: BorderRadius.circular(100.sp),
                      placeholderColor: AppColors.white,
                    ),
                  ),
                  const GapWidget(15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.welcomeText,
                        style: AppFonts.fontLight14grey,
                      ),
                      const GapWidget(3),
                      Text(
                        user.name.value,
                        style: AppFonts.fontHeavy17black,
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
