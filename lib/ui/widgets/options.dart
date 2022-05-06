import 'package:flutter/material.dart';
import 'package:quizapp/models/reponses/monument_post_response.dart';

class Option extends StatelessWidget {
  final Answer answer;
  final Color color;
  final VoidCallback answerTap;
  const Option({
    Key? key,
    required this.answer,
    required this.color,
    required this.answerTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            // color: color,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(15)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "${answer.value}",
            style: TextStyle(color: color, fontSize: 16),
          ),
          // Container(
          //   height: 26,
          //   width: 26,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(50),
          //       border: Border.all(color: Colors.grey)),
          // ),
        ]),
      ),
    );
  }
}
