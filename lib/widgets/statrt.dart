import 'package:flutter/material.dart';
import 'package:quiz/widgets/MultipleChoiceQuestion.dart';
import 'package:quiz/model/quis_model.dart';
import 'package:quiz/service/quiz_service.dart';
import 'package:quiz/widgets/custom_button.dart';

class Start extends StatelessWidget {

  Start({
    super.key,
    required this.quizModel,

  });

  QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15,top: 15),
            child: Text(
              "the word ${quizModel.word} is a ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          MultipleChoiceQuestion(),
        ]);
  }
}
