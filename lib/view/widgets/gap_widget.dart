import 'package:barber/constants/app_imports.dart';

class GapWidget extends StatelessWidget {
  final double size;

  const GapWidget(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
      width: size.w,
    );
  }
}
