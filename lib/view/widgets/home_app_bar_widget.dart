import 'package:barber/constants/app_imports.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.petrol,
          radius: 35.sp,
        ),
        const GapWidget(13),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome", style: AppFonts.fontLight14grey),
            const GapWidget(3),
            Text("Ziad Mashtoly", style: AppFonts.fontHeavy17black),
          ],
        )
      ],
    );
  }
}
