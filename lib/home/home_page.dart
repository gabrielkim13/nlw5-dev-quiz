import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
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
                  children: [
                    QuizCardWidget(
                      title: 'Gerenciamento de Estado',
                      image: Image.asset(AppImages.data),
                      done: 3,
                      total: 10,
                    ),
                    QuizCardWidget(
                      title: 'Construindo Interfaces',
                      image: Image.asset(AppImages.laptop),
                      done: 10,
                      total: 10,
                    ),
                    QuizCardWidget(
                      title: 'Integração Nativa',
                      image: Image.asset(AppImages.hierarchy),
                      done: 9,
                      total: 10,
                    ),
                    QuizCardWidget(
                      title: 'Widgets do Flutter',
                      image: Image.asset(AppImages.blocks),
                      done: 5,
                      total: 10,
                    ),
                    QuizCardWidget(
                      title: 'Construindo Interfaces',
                      image: Image.asset(AppImages.laptop),
                      done: 10,
                      total: 10,
                    ),
                    QuizCardWidget(
                      title: 'Gerenciamento de Estado',
                      image: Image.asset(AppImages.data),
                      done: 3,
                      total: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
