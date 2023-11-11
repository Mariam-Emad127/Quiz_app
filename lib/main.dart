import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz/home.dart';
import 'package:quiz/pages/login_screen.dart';
import 'package:quiz/pages/resgister_page.dart';
import 'package:quiz/pages/result.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
routes: {
  RegisterPage.id :(context)=>RegisterPage(),
  LoginPage.id:(context)=>LoginPage(),

  Result.id:(context)=>Result(),
  HomePage.id:(context)=>HomePage()
 },
  initialRoute:LoginPage.id,
  //HomePage.id,
  //
      //home:QuizStart (),
    );
  }
}


