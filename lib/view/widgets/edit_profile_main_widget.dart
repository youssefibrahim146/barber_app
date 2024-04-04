import 'package:barber/constants/app_imports.dart';

class EditProfileMainWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onClick;

  const EditProfileMainWidget(
    this.title, {
    this.icon,
    this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 20.sp,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.petrol,
                  size: 24.sp,
                ),
                GapWidget(15),
                Text(
                  title,
                  style: AppFonts.fontHeavy17black.copyWith(
                    color: AppColors.petrol,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: AppColors.petrol,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
