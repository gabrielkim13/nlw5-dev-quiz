import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_colors.dart';

import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.init();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state != HomeState.SUCCESS)
      return Scaffold(
        body: Center(
          child: Container(
            width: 128,
            height: 128,
            child: CircularProgressIndicator(
              strokeWidth: 10,
              backgroundColor: AppColors.chartSecondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.purple),
            ),
          ),
        ),
      );

    return Scaffold(
      appBar: AppBarWidget(
        user: controller.user!,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(label: 'Fácil'),
                    LevelButtonWidget(label: 'Médio'),
                    LevelButtonWidget(label: 'Difícil'),
                    LevelButtonWidget(label: 'Perito'),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: controller.quizzes!
                      .map<QuizCardWidget>(
                        (quiz) => QuizCardWidget(
                          title: quiz.title,
                          image: Image.asset(quiz.image),
                          done: quiz.answeredQuestionsCount,
                          total: quiz.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(
                                  questions: quiz.questions,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
