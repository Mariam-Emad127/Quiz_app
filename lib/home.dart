import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:quiz/model/quis_model.dart';
import 'package:quiz/service/quiz_service.dart';
import 'package:quiz/widgets/start_list_view.dart';
import 'package:quiz/widgets/statrt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = "wwwww";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var future;
  late List<QuizModel> quizList;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          actions: [],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'QUESTIONS',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
children:[
                       FutureBuilder<List<QuizModel>>(
                      future: QuizService().readJson(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<QuizModel> quizmodel = snapshot.data!;

                          return StartListView(wordList: snapshot.data!);
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
              ]
                ),
        //),

       // ),
    );
       //)
    //);
  }
}
