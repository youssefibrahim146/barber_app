import 'dart:io';

import 'package:barber/constants/app_imports.dart';

class AIScreen extends GetWidget<AIController> {
  const AIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.petrol,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.sp),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GapWidget(25),
                Row(
                  children: [
                    InkWell(
                      onTap: Get.back,
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        color: AppColors.petrol,
                        size: 30.sp,
                      ),
                    ),
                    GapWidget(5),
                    Hero(
                      tag: AppStrings.appBarTag,
                      child: Card(
                        elevation: 0.sp,
                        margin: EdgeInsets.all(0.sp),
                        color: AppColors.transparent,
                        child: HomeAppBarWidget(false, controller.homeController),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 50.sp,
                  color: AppColors.petrol,
                  indent: 100.w,
                  endIndent: 100.w,
                ),
                Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: controller.pickImage,
                        onLongPress: controller.resetOnClick,
                        child: Container(
                          height: 300.sp,
                          width: 300.sp,
                          decoration: BoxDecoration(
                            color: AppColors.petrol,
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          child: Stack(
                            children: [
                              Obx(
                                () {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    child: controller.image != Rx<File?>(null)
                                        ? Obx(
                                            () {
                                              return Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  AnimatedOpacity(
                                                    duration: Duration(
                                                      milliseconds: 250,
                                                    ),
                                                    opacity: controller.body.value == AppStrings.emptySign ? 1 : 0.2,
                                                    child: Container(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: Image.file(
                                                        controller.image.value!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Obx(
                                                    () {
                                                      return Text(
                                                        controller.body.value,
                                                        style: AppFonts.fontHeavy25White.copyWith(
                                                          fontSize: 30.sp,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          )
                                        : Center(
                                            child: Icon(
                                              Icons.camera,
                                              color: AppColors.white,
                                              size: 100.sp,
                                            ),
                                          ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const GapWidget(25),
                InkWell(
                  onTap: controller.isLoading.value
                      ? () {}
                      : () {
                          controller.predict();
                        },
                  child: Obx(
                    () {
                      return AnimatedContainer(
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        height: controller.isLoading.value ? 50.sp : 50.h,
                        width: controller.isLoading.value ? 50.sp : 250.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.petrol,
                          borderRadius: BorderRadius.circular(controller.isLoading.value ? 100.sp : 15.sp),
                        ),
                        child: Obx(
                          () {
                            return controller.isLoading.value
                                ? CircularProgressIndicator(
                                    color: AppColors.white,
                                  )
                                : Text(
                                    AppStrings.predictText,
                                    style: AppFonts.fontHeavy16White.copyWith(
                                      fontSize: 24.sp,
                                    ),
                                  );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const GapWidget(25),
                Container(
                  height: 100.sp,
                  width: 100.sp,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: Obx(
                    () {
                      WidgetsFlutterBinding.ensureInitialized();
                      String faceType = controller.body.value.trim();
                      print(controller.body.value);
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15.sp),
                        child: controller.body.value == AppStrings.emptySign
                            ? null
                            : Image.asset(faceType == "Oval"
                                ? "assets/images/oval.jpg"
                                : faceType == "Square"
                                    ? "assets/images/square.jpg"
                                    : faceType == "Oblong"
                                        ? "assets/images/oblong.jpeg"
                                        : faceType == "Heart"
                                            ? "assets/images/heart.jpg"
                                            : faceType == "Wavy"
                                                ? "assets/images/wavy.jpeg"
                                                : "assets/images/oval.jpg"),
                      );
                    },
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
