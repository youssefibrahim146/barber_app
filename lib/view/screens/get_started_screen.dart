import '../../constants/app_imports.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.petrolColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.sp, horizontal: 45.sp),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: "auth",
              child: Image.asset(
                "assets/icons/barber logo.png",
                width: 360.w,
                height: 272.h,
              ),
            ),
            Text(
              "Book Your Schedule\nWith Your favorite\nBarber",
              style: fontHeavy25White,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                style: fontHeavy16White.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.offNamed(AppStrings.loginScreenRoute);
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 15.sp, horizontal: 35.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: const Color.fromRGBO(217, 217, 217, 1),
                ),
                child: Text(
                  "Get Started",
                  style: fontHeavy17black.copyWith(fontSize: 22.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
