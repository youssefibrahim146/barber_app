import 'package:barber/constants/app_imports.dart';

class OnTapTextWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const OnTapTextWidget({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "or",
            style: AppFonts.fontHeavy16White.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const GapWidget(8),
          Text(
            text,
            style: AppFonts.fontHeavy16White,
          )
        ],
      ),
    );
  }
}
