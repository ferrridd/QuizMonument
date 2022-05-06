import 'package:flutter/material.dart';
import 'package:quizapp/models/reponses/monument_post_response.dart';
import 'package:quizapp/ui/widgets/options.dart';

class QuestionBox extends StatefulWidget {
  final String QuestionTitle;
  final Answer Variant1;
  final Answer Variant2;
  final Answer Variant3;
  final Answer Variant4;
  const QuestionBox(
      {Key? key,
      required this.QuestionTitle,
      required this.Variant1,
      required this.Variant2,
      required this.Variant3,
      required this.Variant4})
      : super(key: key);

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  List<bool> answersSelected = [false, false, false, false];
  void _questionAnswered(int index) {
    setState(() {
      answersSelected[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(children: [
        Text(this.widget.QuestionTitle,
            style: Theme.of(context).textTheme.headline6),
        Option(
          answer: widget.Variant1,
          color: answersSelected[0]
              ? (widget.Variant1.uid.toInt() == 1 ? Colors.green : Colors.red)
              : Colors.grey,
          answerTap: () {
            _questionAnswered(0);
          },
        ),
        Option(
            answer: widget.Variant2,
            color: answersSelected[1]
                ? widget.Variant2.uid.toInt() == 1
                    ? Colors.green
                    : Colors.red
                : Colors.grey,
            answerTap: () {
              _questionAnswered(1);
            }),
        Option(
            answer: widget.Variant3,
            color: answersSelected[2]
                ? widget.Variant3.uid.toInt() == 1
                    ? Colors.green
                    : Colors.red
                : Colors.grey,
            answerTap: () {
              _questionAnswered(2);
            }),
        Option(
            answer: widget.Variant4,
            color: answersSelected[3]
                ? widget.Variant4.uid.toInt() == 1
                    ? Colors.green
                    : Colors.red
                : Colors.grey,
            answerTap: () {
              _questionAnswered(3);
            })
      ]),
    );
  }
}
