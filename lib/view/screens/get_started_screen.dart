import 'package:barber/constants/app_imports.dart';

class GetStartedScreen extends GetWidget<GetStartedController> {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.petrol,
      body: Hero(
        tag: AppStrings.containerTag,
        child: Card(
          elevation: 0.sp,
          margin: EdgeInsets.all(0.sp),
          color: AppColors.transparent,
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppStrings.logoAsset,
                  width: 360.w,
                  height: 272.h,
                ),
                Text(
                  AppStrings.getStatedTitle,
                  style: AppFonts.fontHeavy25White,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.sp,
                  ),
                  child: Text(
                    AppStrings.getStatedSubTitle,
                    style: AppFonts.fontHeavy16White.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: controller.getStartedOnClick,
                  child: Card(
                    elevation: 10.sp,
                    child: SizedBox(
                      height: 45.h,
                      width: 150.w,
                      child: Center(
                        child: Text(
                          AppStrings.getStartedText,
                          style: AppFonts.fontHeavy17black.copyWith(
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
