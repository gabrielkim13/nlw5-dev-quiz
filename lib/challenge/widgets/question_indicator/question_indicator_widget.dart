import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_text_styles.dart';

import 'package:DevQuiz/shared/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int current;

  final int total;

  QuestionIndicatorWidget(
      {Key? key, required this.current, required this.total})
      : super(key: key);

  String _formatQuestionNumber(int questionNumber) =>
      questionNumber >= 10 ? '$questionNumber' : '0$questionNumber';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão ${this._formatQuestionNumber(current)}',
                style: AppTextStyles.body,
              ),
              Text(
                'de ${this._formatQuestionNumber(total)}',
                style: AppTextStyles.body,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ProgressIndicatorWidget(value: this.current / this.total),
          ),
        ],
      ),
    );
  }
}
