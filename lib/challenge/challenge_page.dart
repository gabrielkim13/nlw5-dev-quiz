import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  bool isAnswered = false;

  final controller = ChallengeController();

  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.isAnswered = false;
      controller.isCorrect = false;

      controller.currentPage = pageController.page!.toInt();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(144),
        child: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => QuestionIndicatorWidget(
                current: value + 1,
                total: widget.questions.length,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: widget.questions
              .map(
                (question) => QuizWidget(
                  question: question,
                  onChange: (bool isCorrect) {
                    controller.isCorrect = isCorrect;
                    controller.isAnswered = true;
                  },
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: ValueListenableBuilder<bool>(
            valueListenable: controller.isAnsweredNotifier,
            builder: (context, isAnswered, _) {
              if (isAnswered && controller.isCorrect) {
                controller.score += 1;

                debugPrint(controller.score.toString());

                return Expanded(
                  child: NextButtonWidget.green(
                    text: 'Próximo',
                    onTap: () {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },
                  ),
                );
              }

              if (isAnswered && !controller.isCorrect) {
                return Expanded(
                  child: NextButtonWidget.red(
                    text: 'Próximo',
                    onTap: () {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },
                  ),
                );
              }

              return Expanded(
                child: NextButtonWidget.normal(
                  text: 'Pular',
                  onTap: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
