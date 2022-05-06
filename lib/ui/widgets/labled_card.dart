import 'package:flutter/material.dart';
import 'package:quizapp/ui/screens/quiz_page.dart';
import 'package:quizapp/ui/widgets/expansion_list.dart';
import 'package:quizapp/ui/widgets/label_box.dart';

class LabeledCard extends StatelessWidget {
  final String labelMain;
  final String? labelSecondary;
  final String imageUrl;
  final String description;
  final int uid;
  double? height;
  double? width;
  final double borderRadius;

  LabeledCard(
      {Key? key,
      required this.labelMain,
      this.labelSecondary,
      required this.imageUrl,
      required this.description,
      required this.uid,
      this.height,
      this.width,
      this.borderRadius = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _expanded = false;
    var _test = "Full Screen";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Column(
        children: [
          Container(
            height: height ?? MediaQuery.of(context).size.height * .25,
            width: width ?? MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: LabelBox(text: labelMain),
                ),
                labelSecondary != null
                    ? Positioned(
                        bottom: 10,
                        right: 10,
                        child: LabelBox(
                          text: labelSecondary!,
                          fontSize: 14,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          DescriptionPanel(
            Description: this.description,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => QuizPage(
                              Title: this.labelMain,
                              Uid: this.uid,
                            )));
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.362,
                        vertical: 12),
                    child: Text("Start Quiz!"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
