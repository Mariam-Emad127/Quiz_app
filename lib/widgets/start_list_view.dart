import 'package:flutter/material.dart';
import 'package:quiz/model/quis_model.dart';
import 'package:quiz/pages/result.dart';
import 'package:quiz/widgets/statrt.dart';

// class StartListView extends StatelessWidget {
//     StartListView({super.key, required this.wordList});
//   final List<QuizModel> wordList;
//     var _selection ;
//
//     @override
//   Widget build(BuildContext context) {
//     return Column(
//
//       children:[
//
//         ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   itemCount: wordList.length,
//                   itemBuilder: (context,index) {
//
//                       return Start(quizModel: wordList[0] );
//
//                   }
//
//         ),
//
//
//     ]
//     );
//     }
// }

 

class StartListView extends StatefulWidget {
  static String id="";
  final List<QuizModel> wordList;

  StartListView({Key? key, required this.wordList}) : super(key: key);

  @override
  _StartListViewState createState() => _StartListViewState();
}

class _StartListViewState extends State<StartListView> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration( borderRadius:BorderRadius.circular(20))  ,
         
        

      child: Column(
          children: [

              Container(
                height: 300,
               child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.wordList.length,
                  itemBuilder: (context, index) {

                    return Start(quizModel: widget.wordList[index]);
                  },
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                ),
              ),
           // ),
            ElevatedButton(
              onPressed: () {
                if (_currentPageIndex < widget.wordList.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Reached the last item, handle accordingly
                  Navigator.pushNamed(context, Result.id);
                  print('Last item reached');
                }
              },
              child: Text(
                _currentPageIndex < widget.wordList.length - 1 ? 'Next' : 'Finish',
              ),
            ),
          ],
       // ),
      ),
    );
  }
}