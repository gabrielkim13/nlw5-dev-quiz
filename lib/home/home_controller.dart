import 'package:flutter/foundation.dart';

import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';

import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/home_repository.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier = ValueNotifier(HomeState.LOADING);

  HomeState get state => stateNotifier.value;
  set state(HomeState state) => stateNotifier.value = state;

  UserModel? user;

  List<QuizModel>? quizzes;

  final HomeRepository repository = HomeRepository();

  void init() async {
    try {
      await Future.wait([
        _getUser(),
        _getQuizzes(),
      ]);

      state = HomeState.SUCCESS;
    } catch (error) {
      debugPrint(error.toString());

      state = HomeState.ERROR;
    }
  }

  Future<void> _getUser() async {
    this.user = await repository.getUser();
  }

  Future<void> _getQuizzes() async {
    this.quizzes = await repository.getQuizzes();
  }
}
