import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../bloc/quiz3_bloc.dart';

class Quiz3Page extends StatelessWidget {
  final Quiz3Bloc quiz3Bloc;

  const Quiz3Page({required this.quiz3Bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Genral Knowledge Quiz'),
      ),
      body: BlocBuilder<Quiz3Bloc, int>(
        bloc: quiz3Bloc,
        builder: (context, state) {
          if (state >= quiz3Bloc.questions.length) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height:30),
                Text(
                  'Quiz 3 Completed',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  'Earned Rewards: ${quiz3Bloc.totalScore}',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SfLinearGauge(
                    barPointers: [
                      LinearBarPointer(
                        value: quiz3Bloc.totalScore.toDouble(),
                        // Apply radial gradient
                        shaderCallback: (bounds) => RadialGradient(
                          radius: 30,
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
                  'Skipped Questions: ${quiz3Bloc.skippedQuestions.length}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    quiz3Bloc.resetQuiz();
                  },
                  icon: Icon(Icons.replay),
                  label: Text('Restart Quiz 3'),
                ),
                SizedBox(height:20),
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
            final currentQuestion = quiz3Bloc.questions[state];
            return Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: Text("Question: "+
                    currentQuestion.questionText,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                ...currentQuestion.answers.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.only(left:12.0,right: 12.0),
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
                          quiz3Bloc.answerQuestion(answer.score);
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
                        quiz3Bloc.previousQuestion();
                      },
                      icon: Icon(Icons.navigate_before),
                    ),
                    IconButton(
                      onPressed: () {
                        quiz3Bloc.skipQuestion();
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
                  label: Text('Return to HomePage',style: TextStyle(color: Colors.white),),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
