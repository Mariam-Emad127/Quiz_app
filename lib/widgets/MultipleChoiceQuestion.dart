
import 'package:flutter/material.dart';
import 'package:quiz/model/quis_model.dart';

class MultipleChoiceQuestion extends StatefulWidget {


    MultipleChoiceQuestion({super.key,
    //  required this.onTap
    });
   // final   Function(String) onTap;
//var Choose;
    //List <QuizModel> quizModel;
  @override
  State<MultipleChoiceQuestion> createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {


  int selectedOption = -1;
  List choices = ["adverb", "verb", "noun", "adjective"];

  var _selection;
  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: choices.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Radio<int>(
            value: index,
            groupValue:   selectedOption ,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });

            },
          ),
          title: Text(choices[index]),
          onTap:
              () {

            setState(() {
             ///onTap;
              selectedOption = index;
            });

          },
        );

      },
    );
  }
}
