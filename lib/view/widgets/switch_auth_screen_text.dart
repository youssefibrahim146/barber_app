import 'package:flutter/material.dart';

import '../../constants/fonts.dart';
import '../../helpers/app_space.dart';

class SwitchAuthText extends StatelessWidget {
  final VoidCallback onTap;
  final String text1, text2;

  const SwitchAuthText(
      {super.key,
      required this.onTap,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: fontHeavy16White.copyWith(fontWeight: FontWeight.w400),
        ),
        const SpaceTap(size: 8),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: fontHeavy16White,
          ),
        )
      ],
    );
  }
}
