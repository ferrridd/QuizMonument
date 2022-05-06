import 'package:dio/dio.dart';
import 'package:quizapp/models/reponses/monument_post_response.dart';
import 'package:quizapp/models/reponses/monument_response.dart';
import 'package:quizapp/services/base_service.dart';

class QuestionService extends BaseService {
  QuestionService() : super('quiz');

  Future<MonumentQuiz> createQuiz({required int index}) async {
    late MonumentQuiz retrievedQuiz = MonumentQuiz(questions: []);

    try {
      Response response = await dio.post(
        serviceBuilder.addParam("question").build(),
        data: '{"monumentUid" : ${index}}',
        options: options,
        //{"monumentUid" : 2}
      );

      print('${response.data}');

      retrievedQuiz = MonumentQuiz.fromJson(response.data);
    } catch (e) {
      print('Error  getting quiz: $e');
    }

    return retrievedQuiz;
  }
}
