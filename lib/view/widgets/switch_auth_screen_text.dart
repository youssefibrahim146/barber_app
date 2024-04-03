import 'package:barber/constants/app_imports.dart';

class SwitchAuthText extends StatelessWidget {
  final VoidCallback onTap;
  final String text1, text2;

  const SwitchAuthText({
    super.key,
    required this.onTap,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: AppFonts.fontHeavy16White.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        const GapWidget(8),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: AppFonts.fontHeavy16White,
          ),
        )
      ],
    );
  }
}
