import '../constants/app_imports.dart';

class SpaceTap extends StatelessWidget {
  final double size;

  const SpaceTap({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
      width: size.w,
    );
  }
}
