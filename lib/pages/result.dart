import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});
  static String id='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'RESULT',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),




    );
  }
}
