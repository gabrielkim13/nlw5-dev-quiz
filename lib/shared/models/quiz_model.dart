import 'dart:convert';

import 'package:DevQuiz/shared/models/question_model.dart';

enum Level {
  EASY,
  MEDIUM,
  HARD,
  EXPERT,
}

extension LevelExtension on Level {
  String get parse => {
        Level.EASY: 'EASY',
        Level.MEDIUM: 'MEDIUM',
        Level.HARD: 'HARD',
        Level.EXPERT: 'EXPERT',
      }[this]!;
}

extension LevelStringExtension on String {
  Level get parseLevel => {
        'EASY': Level.EASY,
        'MEDIUM': Level.MEDIUM,
        'HARD': Level.HARD,
        'EXPERT': Level.EXPERT,
      }[this]!;
}

class QuizModel {
  final String title;

  final List<QuestionModel> questions;

  final int answeredQuestionsCount;

  final String image;

  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.answeredQuestionsCount = 0,
      required this.image,
      required this.level})
      : assert(questions.isNotEmpty);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions?.map((x) => x.toMap())?.toList(),
      'answeredQuestionsCount': answeredQuestionsCount,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      image: map['image'],
      level: map['level'].toString().parseLevel,
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      answeredQuestionsCount: map['answeredQuestionsCount'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
