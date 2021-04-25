import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:DevQuiz/core/app_colors.dart';

class NextButtonWidget extends StatelessWidget {
  final String text;

  final Color color;

  final Color borderColor;

  final Color overlayColor;

  final TextStyle textStyle;

  final VoidCallback onTap;

  NextButtonWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.borderColor,
    required this.overlayColor,
    required this.textStyle,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.normal({
    required this.text,
    required this.onTap,
  })  : this.color = AppColors.white,
        this.borderColor = AppColors.border,
        this.overlayColor = AppColors.border,
        this.textStyle = GoogleFonts.notoSans(
          color: AppColors.grey,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        );

  NextButtonWidget.green({
    required this.text,
    required this.onTap,
  })  : this.color = AppColors.darkGreen,
        this.borderColor = AppColors.darkGreen,
        this.overlayColor = AppColors.darkerGreen,
        this.textStyle = GoogleFonts.notoSans(
          color: AppColors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        );

  NextButtonWidget.red({
    required this.text,
    required this.onTap,
  })  : this.color = AppColors.darkRed,
        this.borderColor = AppColors.darkRed,
        this.overlayColor = AppColors.darkerRed,
        this.textStyle = GoogleFonts.notoSans(
          color: AppColors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        );

  NextButtonWidget.purple({
    required this.text,
    required this.onTap,
  })  : this.color = AppColors.purple,
        this.borderColor = AppColors.purple,
        this.overlayColor = AppColors.darkerPurple,
        this.textStyle = GoogleFonts.notoSans(
          color: AppColors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          overlayColor: MaterialStateProperty.all(overlayColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
