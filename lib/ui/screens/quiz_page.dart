import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizapp/models/reponses/monument_post_response.dart';
import 'package:quizapp/models/reponses/monument_response.dart';
import 'package:quizapp/services/question_service.dart';
import 'package:quizapp/ui/widgets/question_box.dart';

// import 'package:lib/ui/screens/quiz_page.dart';
class QuizPage extends StatefulWidget {
  final String Title;
  final int Uid;
  const QuizPage({
    Key? key,
    required this.Title,
    required this.Uid,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuestionService questionService = QuestionService();
  late MonumentQuiz monumentQuiz = MonumentQuiz(questions: []);

  @override
  void initState() {
    super.initState();
    fetchQuiz();
  }

  Future<void> fetchQuiz() async {
    monumentQuiz = await questionService.createQuiz(index: widget.Uid);
    setState(() {});
    debugPrint(monumentQuiz.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(alignment: Alignment.center, child: Text(widget.Title)),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${this.widget.Title} questions",
                    style: TextStyle(color: Colors.black, fontSize: 28),
                  ),
                ),
                color: Colors.transparent,
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: monumentQuiz.questions.length,
                  itemBuilder: (BuildContext context, int index) {
                    // return //Text(monumentQuiz.questions[index].title);
                    return QuestionBox(
                        QuestionTitle: monumentQuiz.questions[index].title,
                        Variant1: monumentQuiz.questions[index].answers[0],
                        Variant2: monumentQuiz.questions[index].answers[1],
                        Variant3: monumentQuiz.questions[index].answers[2],
                        Variant4: monumentQuiz.questions[index].correctAnswer);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
