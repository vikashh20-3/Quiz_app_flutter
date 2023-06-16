import 'package:flutter/material.dart';
import 'package:quiz/screens/home_screen.dart';

import 'bloc/quiz2_bloc.dart';
import 'bloc/quiz3_bloc.dart';
import 'bloc/quiz_bloc.dart';
import 'model/quiz2_model.dart';
import 'model/quiz3_model.dart';
import 'model/quiz_model.dart';

void main() {
  final quizQuestions = [
    Question('What is Flutter?', [
      Answer('open-source backend development framework', 10),
      Answer('open-source UI toolkit', 25),
      Answer(' DBMS toolkit', 33),
      Answer('front-end cross-platform', 31),
    ]),
    Question('Who developed the Flutter Framework and continues to maintain it today?', [
      Answer('FaceBook', 21),
      Answer('Microsoft', 10),
      Answer('Google', 25),
      Answer('Oracle', 13),
    ]),
    Question('Which programming language is used to build Flutter applications?', [
      Answer('Kotlin', 10),
      Answer('Dart', 25),
      Answer('Java', 16),
      Answer('Go', 14),
    ]),
    Question('How many types of widgets are there in Flutter??', [
      Answer('2', 25),
      Answer('4', 15),
      Answer('6', 16),
      Answer('8+', 14),
    ]),
  ];

  final quiz2Questions = [
    Question2('Which of the following is a characteristic of Dart programming language?', [
      Answer2('Statically typed', 10),
      Answer2('Dynamically typed', 15),
      Answer2('Both Statically typed and Dynamically typed', 25),
      Answer2('None of the Above', 11),
    ]),
    Question2('Which of the following is the correct syntax for defining a variable in Dart?', [
      Answer2('var x = 5;', 25),
      Answer2(' x = 5;', 15),
      Answer2('int x = 5;', 13),
      Answer2('variable x = 5;', 11),
    ]),
    Question2('Which of the following is the correct syntax for defining a function in Dart?', [
      Answer2('function foo() {}', 10),
      Answer2(' void foo() {}', 25),
      Answer2('int foo() {}', 13),
      Answer2('dynamic foo() {}', 21),
    ]),
    Question2('What is the purpose of the “async” keyword in Dart?', [
      Answer2('To define a function that can be returns a Future', 25),
      Answer2('To define a function that can be run in a separate isolate', 15),
      Answer2('To define a function that can be run in a separate thread', 13),
      Answer2('To define a function that can be run concurrently with other functions', 11),
    ]),

    // Add more questions for Quiz 2
  ];

  final quiz3Questions = [
    Question3('Which is the Smallest Ocean in the World?', [
      Answer3('Indian', 10),
      Answer3('Atlantic', 15),
      Answer3(' Pacific', 13),
      Answer3('Arctic', 25),
    ]),
    Question3('Dead Sea is located between which two countries?', [
      Answer3('Jordan and Sudan ', 10),
      Answer3('Jordan and Israel', 25),
      Answer3(' Turkey and UAE', 13),
      Answer3('UAE and Egypt  ', 15),
    ]),
    Question3('Dead Sea is located between which two countries?', [
      Answer3('Jordan and Sudan ', 10),
      Answer3('Jordan and Israel', 25),
      Answer3(' Turkey and UAE', 13),
      Answer3('UAE and Egypt  ', 15),
    ]),
    Question3('Total Number of Oceans in the world?', [
      Answer3('3 ', 10),
      Answer3('5', 25),
      Answer3(' 7', 13),
      Answer3('12  ', 15),
    ]),
    // Add more questions for Quiz 3
  ];


  final quizBloc = QuizBloc(quizQuestions);
  final quiz2Bloc = Quiz2Bloc(quiz2Questions);
  final quiz3Bloc = Quiz3Bloc(quiz3Questions);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.transparent,
        primaryColor: Colors.red,
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
              quizBloc: quizBloc,
              quiz2Bloc: quiz2Bloc,
              quiz3Bloc: quiz3Bloc,
            ),
      },
    ),
  );
}


