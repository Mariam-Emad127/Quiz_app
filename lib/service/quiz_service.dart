import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

import '../model/quis_model.dart';

/*class QuizService {
  Future<List<QuizModel>> readJson() async {

    final String response = await rootBundle.loadString('assets/WordList.json');
    Map<String, dynamic> data = await json.decode(response);


    List<dynamic> wordList = data["wordList"];
    List<QuizModel> quizList = [];

    for (var i in wordList) {
      QuizModel quizModel =
          QuizModel(id: i['id'], word: i["word"], pos: i["pos"]);

      quizList.add(quizModel);
    }

    quizList.shuffle();
    quizList.sublist(0, 5);
    return quizList;
  }
}*/


 class QuizService {
  Future<List<QuizModel>> readJson() async {
    final String response = await rootBundle.loadString('assets/WordList.json');
    Map<String, dynamic> data = json.decode(response);

    List<dynamic> wordList = data["wordList"];
    List<QuizModel> quizList = [];

    for (var i in wordList) {
      QuizModel quizModel = QuizModel(
        id: i['id'],
        word: i["word"],
        pos: i["pos"],
      );

      quizList.add(quizModel);
    }

    quizList.shuffle();
    quizList = quizList.sublist(0, 5); // Assign the sublist back to the variable

    return quizList;
  }
}