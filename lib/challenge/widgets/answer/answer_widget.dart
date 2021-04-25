import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';

import 'package:DevQuiz/shared/models/answer_model.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;

  final bool isSelected;

  final bool isDisabled;

  final VoidCallback onTap;

  AnswerWidget(
      {Key? key,
      required this.answer,
      required this.onTap,
      this.isSelected = false,
      this.isDisabled = false})
      : super(key: key);

  Color get cardColor {
    if (isSelected && answer.isCorrect) return AppColors.lightGreen;

    if (isSelected && !answer.isCorrect) return AppColors.lightRed;

    return AppColors.white;
  }

  Color get borderColor {
    if (isSelected && answer.isCorrect) return AppColors.green;

    if (isSelected && !answer.isCorrect) return AppColors.red;

    return AppColors.border;
  }

  TextStyle get textStyle {
    if (isSelected && answer.isCorrect) return AppTextStyles.bodyDarkGreen;

    if (isSelected && !answer.isCorrect) return AppTextStyles.bodyDarkRed;

    return AppTextStyles.body;
  }

  Container get icon {
    if (isSelected && answer.isCorrect)
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

    if (isSelected && !answer.isCorrect)
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
      child: IgnorePointer(
        ignoring: isDisabled,
        child: GestureDetector(
          onTap: onTap,
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
                      answer.title,
                      style: this.textStyle,
                    ),
                  ),
                  this.icon,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
