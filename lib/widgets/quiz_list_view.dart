/*
import 'package:flutter/material.dart';
import 'package:quiz/service/quiz_service.dart';

import 'model/quis_model.dart';


class QuizListView extends StatefulWidget {
  static String id="wwwww";
  @override
  _QuizListViewState createState() => _QuizListViewState();
}

class _QuizListViewState extends State<QuizListView> {
  final QuizService quizService = QuizService();
  late Future<List<QuizModel>> quizListFuture;


  @override
  void initState() {
    super.initState();
    quizListFuture = quizService.readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz List'),
      ),
      body: FutureBuilder<List<QuizModel>>(
        future: quizListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QuizModel> quizList = snapshot.data!;
            return ListView.builder(
              itemCount: quizList.length,
              itemBuilder: (context, index) {
                QuizModel quiz = quizList[index];
                return ListTile(
                  title: Text(quiz.word),
                  subtitle: Text(quiz.pos),
                  // You can add more widgets or customize the ListTile as needed
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}*/
