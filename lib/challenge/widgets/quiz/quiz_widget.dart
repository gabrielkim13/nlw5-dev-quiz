import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_text_styles.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        child: Column(
          children: [
            Text(
              this.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(height: 24),
            Column(
              children: [
                AnswerWidget(
                  answer: 'Kit de desenvolvimento de interface do usuário',
                  isCorrect: false,
                  isSelected: false,
                ),
                AnswerWidget(
                  answer:
                      'Possibilita a criação de aplicativos compilados nativamente',
                  isCorrect: true,
                  isSelected: true,
                ),
                AnswerWidget(
                  answer: 'Acho que é uma marca de café do Himalaia',
                  isCorrect: false,
                  isSelected: false,
                ),
                AnswerWidget(
                  answer:
                      'Possibilita a criação de desktops que são muito incríveis',
                  isCorrect: false,
                  isSelected: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
