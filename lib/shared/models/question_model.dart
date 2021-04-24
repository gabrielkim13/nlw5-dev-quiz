import 'dart:convert';

import 'package:DevQuiz/shared/models/answer_model.dart';

class QuestionModel {
  final String question;

  final List<AnswerModel> answers;

  QuestionModel({required this.question, required this.answers})
      : assert(answers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answers': answers?.map((x) => x.toMap())?.toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'],
      answers: List<AnswerModel>.from(
          map['answers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
