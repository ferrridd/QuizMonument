import 'package:flutter/material.dart';
import 'package:quizapp/models/reponses/monument_response.dart';
import 'package:quizapp/services/explore_service.dart';
import 'package:quizapp/ui/widgets/label_box.dart';
import 'package:quizapp/ui/widgets/labled_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExploreService exploreService = ExploreService();

  MonumentResponse monumentResponse = MonumentResponse(monuments: []);

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async {
    monumentResponse = await exploreService.getMonuments();
    setState(() {});
    //   debugPrint(monumentResponse.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(child: Text("Monuments of Azerbaijan")),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: monumentResponse.monuments.length,
            itemBuilder: (BuildContext context, int index) {
              return LabeledCard(
                uid: monumentResponse.monuments[index].uid,
                labelMain: monumentResponse.monuments[index].name,
                labelSecondary: monumentResponse.monuments[index].location,
                imageUrl: monumentResponse.monuments[index].photoUrl,
                description: monumentResponse.monuments[index].description,
              );
            },
          ),
        ));
  }
}
