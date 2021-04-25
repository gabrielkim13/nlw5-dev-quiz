import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(0);

  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  final isAnsweredNotifier = ValueNotifier<bool>(false);

  bool get isAnswered => isAnsweredNotifier.value;
  set isAnswered(bool value) => isAnsweredNotifier.value = value;

  bool isCorrect = false;

  int score = 0;
}
