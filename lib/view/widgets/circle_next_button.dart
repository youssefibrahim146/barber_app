import 'package:barber/constants/app_colors.dart';
import 'package:barber/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class CircleNextButton extends StatelessWidget {
  final VoidCallback onTap;

  const CircleNextButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.petrol,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.white,
              width: 5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.white,
              size: 30,
            ),
            onPressed: onTap,
          ),
        ),
        Text(
          "Next",
          style: AppFonts.fontHeavy25White,
        ),
      ],
    );
  }
}
