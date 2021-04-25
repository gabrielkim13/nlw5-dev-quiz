import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_text_styles.dart';

import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';

typedef OnChangeCallback = void Function(bool);

class QuizWidget extends StatefulWidget {
  final QuestionModel question;

  final OnChangeCallback onChange;

  QuizWidget({Key? key, required this.question, required this.onChange})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;

  List<AnswerModel> get answers => widget.question.answers;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        child: Column(
          children: [
            Text(
              widget.question.question,
              style: AppTextStyles.heading,
            ),
            SizedBox(height: 24),
            Column(
              children: widget.question.answers
                  .map(
                    (answer) => AnswerWidget(
                      answer: answer,
                      onTap: () {
                        selectedIndex = answers.indexOf(answer);

                        widget.onChange(answer.isCorrect);

                        setState(() {});
                      },
                      isDisabled: selectedIndex != -1,
                      isSelected: answers.indexOf(answer) == selectedIndex,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
