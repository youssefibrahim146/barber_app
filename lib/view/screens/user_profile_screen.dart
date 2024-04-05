import 'package:barber/constants/app_imports.dart';
import 'package:barber/view/widgets/edit_profile_main_widget.dart';

class UserProfileScreen extends GetWidget<UserProfileController> {
  const UserProfileScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  AppStrings.accountSettingText,
                  style: AppFonts.fontHeavy20Petrol,
                ),
                EditProfileMainWidget(
                  AppStrings.editProfileText,
                  icon: Icons.person,
                  onClick: controller.editProfileOnClick,
                ),
                EditProfileMainWidget(
                  AppStrings.changePasswordText,
                  icon: Icons.lock,
                  onClick: controller.changePasswordButtonOnClick,
                ),
                EditProfileMainWidget(
                  AppStrings.reservationsText,
                  icon: Icons.checklist_outlined,
                  onClick: () {},
                ),
                Divider(
                  height: 50.sp,
                  color: AppColors.petrol,
                  indent: 50.w,
                  endIndent: 50.w,
                ),
                Text(
                  AppStrings.moreText,
                  style: AppFonts.fontHeavy20Petrol,
                ),
                EditProfileMainWidget(
                  AppStrings.contactUsText,
                  icon: Icons.support_agent,
                  onClick: () {},
                ),
                EditProfileMainWidget(
                  AppStrings.logoutText,
                  icon: Icons.logout,
                  onClick: controller.logoutButtonOnClick,
                ),
                EditProfileMainWidget(
                  AppStrings.deleteAccountText,
                  icon: Icons.delete,
                  onClick: controller.deleteAccountOnClick,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
