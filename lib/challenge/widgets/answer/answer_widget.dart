import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerWidget extends StatelessWidget {
  final String answer;

  final bool isCorrect;

  final bool isSelected;

  AnswerWidget(
      {Key? key,
      required this.answer,
      required this.isCorrect,
      required this.isSelected})
      : super(key: key);

  Color get cardColor {
    if (this.isSelected && this.isCorrect) return AppColors.lightGreen;

    if (this.isSelected && !this.isCorrect) return AppColors.lightRed;

    return AppColors.white;
  }

  Color get borderColor {
    if (this.isSelected && this.isCorrect) return AppColors.green;

    if (this.isSelected && !this.isCorrect) return AppColors.red;

    return AppColors.border;
  }

  TextStyle get textStyle {
    if (this.isSelected && this.isCorrect) return AppTextStyles.bodyDarkGreen;

    if (this.isSelected && !this.isCorrect) return AppTextStyles.bodyDarkRed;

    return AppTextStyles.body;
  }

  Container get icon {
    if (this.isSelected && this.isCorrect)
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.green,
              blurRadius: 8,
              spreadRadius: 2,
            )
          ],
        ),
        child: Icon(Icons.check, size: 16, color: AppColors.white),
      );

    if (this.isSelected && !this.isCorrect)
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors.darkRed,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.red,
              blurRadius: 8,
              spreadRadius: 2,
            )
          ],
        ),
        child: Icon(Icons.clear, size: 16, color: AppColors.white),
      );

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: this.cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: this.borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 210),
                child: Text(
                  this.answer,
                  style: this.textStyle,
                ),
              ),
              this.icon,
            ],
          ),
        ),
      ),
    );
  }
}
