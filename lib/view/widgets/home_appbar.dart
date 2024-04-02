import '../../constants/app_imports.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.petrolColor,
          radius: 35.sp,
        ),
        const SpaceTap(size: 13),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome", style: fontLight14grey),
            const SpaceTap(size: 3),
            Text("Ziad Mashtoly", style: fontHeavy17black),
          ],
        )
      ],
    );
  }
}
