import '../../constants/app_imports.dart';

class OnTapText extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const OnTapText({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "or",
            style: fontHeavy16White.copyWith(
                fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SpaceTap(size: 8),
          Text(
            text,
            style: fontHeavy16White,
          )
        ],
      ),
    );
  }
}
