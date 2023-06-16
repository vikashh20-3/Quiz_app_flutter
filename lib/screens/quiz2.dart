import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../bloc/quiz2_bloc.dart';

class Quiz2Page extends StatelessWidget {
  final Quiz2Bloc quiz2Bloc;

  const Quiz2Page({required this.quiz2Bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dart Quiz'),
      ),
      body: BlocBuilder<Quiz2Bloc, int>(
        bloc: quiz2Bloc,
        builder: (context, state) {
          if (state >= quiz2Bloc.questions.length) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Quiz 2 Completed',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  'Rewards earned: ${quiz2Bloc.totalScore}',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SfLinearGauge(
                    animateAxis: true,
                    animateRange: true,
                    animationDuration: 2000,
                    barPointers: [
                      LinearBarPointer(
                        value: quiz2Bloc.totalScore.toDouble(),
                        // Apply radial gradient
                        shaderCallback: (bounds) => RadialGradient(
                          radius: 50,
                          colors: [
                            Colors.redAccent,
                            Colors.blueAccent,
                            Colors.greenAccent,
                          ],
                        ).createShader(bounds),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Skipped Questions: ${quiz2Bloc.skippedQuestions.length}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    quiz2Bloc.resetQuiz();
                  },
                  icon: Icon(Icons.replay),
                  label: Text('Restart Quiz 2'),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text('Go Back'),
                ),
              ],
            );
          } else {
            final currentQuestion = quiz2Bloc.questions[state];
            return Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Question: "+
                    currentQuestion.questionText,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                ...currentQuestion.answers.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.only(left:12.0,right:12.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          quiz2Bloc.answerQuestion(answer.score);
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text("# "+
                                answer.text,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        quiz2Bloc.previousQuestion();
                      },
                      icon: Icon(Icons.navigate_before),
                    ),
                    IconButton(
                      onPressed: () {
                        quiz2Bloc.skipQuestion();
                      },
                      icon: Icon(Icons.navigate_next),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text('Return to Homepage',style: TextStyle(color: Colors.white),),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
