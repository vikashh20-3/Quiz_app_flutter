import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../bloc/quiz_bloc.dart';

class QuizPage extends StatelessWidget {
  final QuizBloc quizBloc;

  const QuizPage({required this.quizBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Quiz'),

      ),
      body: BlocBuilder<QuizBloc, int>(
        bloc: quizBloc,
        builder: (context, state) {
          if (state >= quizBloc.questions.length) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Quiz Completed',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  'Skipped Questions: ${quizBloc.skippedQuestions.length}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height:20),
                Text(
                  'Rewards Earned: ${quizBloc.totalScore}',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SfLinearGauge(
                    barPointers: [
                      LinearBarPointer(
                        value: quizBloc.totalScore.toDouble(),
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
                ElevatedButton(
                  onPressed: () {
                    quizBloc.resetQuiz();
                  },
                  child: Text('Restart Quiz'),
                ),
                SizedBox(height: 30,),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.home_max),
                  label: Text(
                    'Return to homepage',),
                ),
              ],
            );
          } else {
            final currentQuestion = quizBloc.questions[state];
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
                    padding: const EdgeInsets.only(left:12.0,right: 12),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            quizBloc.answerQuestion(answer.score);
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
                                child: Text("#  "+answer.text,style: TextStyle(
                                    color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        quizBloc.previousQuestion();
                      },
                      icon: Icon(Icons.navigate_before),
                    ),
                    IconButton(
                      onPressed: () {
                        quizBloc.skipQuestion();
                      },
                      icon: Icon(Icons.navigate_next),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Return to homepage',style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
