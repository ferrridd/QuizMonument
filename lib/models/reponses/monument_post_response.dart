// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Question> questionFromJson(String str) =>
    List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MonumentQuiz {
  final List<Question> questions;

  MonumentQuiz({
    required this.questions,
  });
  factory MonumentQuiz.fromJson(List<dynamic> json) => MonumentQuiz(
      questions: List<Question>.from(json.map((x) => Question.fromJson(x))));
  List<dynamic> toJson() =>
      List<dynamic>.from(questions.map((x) => x.toJson()));
}

class Question {
  Question({
    required this.uid,
    required this.title,
    required this.correctAnswer,
    required this.answers,
  });

  final int uid;
  final String title;
  final Answer correctAnswer;
  final List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        uid: json["uid"],
        title: json["title"],
        correctAnswer: Answer.fromJson(json["correctAnswer"]),
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "title": title,
        "correctAnswer": correctAnswer.toJson(),
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.uid,
    required this.value,
  });

  final int uid;
  final String value;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        uid: json["uid"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "value": value,
      };
}
