import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz2.dart';
import 'package:quiz/screens/quiz3.dart';
import 'package:quiz/screens/quiz_page.dart';

import '../bloc/quiz2_bloc.dart';
import '../bloc/quiz3_bloc.dart';
import '../bloc/quiz_bloc.dart';

class HomePage extends StatefulWidget {
  final QuizBloc quizBloc;
  final Quiz2Bloc quiz2Bloc;
  final Quiz3Bloc quiz3Bloc;

  const HomePage({
    required this.quizBloc,
    required this.quiz2Bloc,
    required this.quiz3Bloc,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;
  @override
  void initState() {
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          10.0; //Back to top botton will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        showbtn = true;
        setState(() {
          //update state
        });
      } else {
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quizes'),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 500), //show/hide animation
        opacity: showbtn ? 1.0 : 0.4, //set obacity to 1 on visible, or hide
        child: FloatingActionButton(
          onPressed: () {
            scrollController.animateTo(
                //go to top of scroll
                0, //scroll offset to go
                duration:
                    const Duration(milliseconds: 500), //duration of scroll
                curve: Curves.fastOutSlowIn //scroll type
                );
          },
          child: const Icon(Icons.arrow_upward),
          backgroundColor: Colors.redAccent,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Center(
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 1.7,
                padding: const EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuizPage(quizBloc: widget.quizBloc),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        color: Colors.green[100],
                        shadowColor: Colors.blueGrey,
                        elevation: 20,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Image.asset('assets/flutter.jpeg'),
                              title: const Text(
                                "Flutter Quiz",
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: const Text('Start flutter Quiz'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Quiz2Page(quiz2Bloc: widget.quiz2Bloc),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Container(
                              height: MediaQuery.of(context).size.height / 7,
                              child: Image.asset('assets/dart.png'),
                            ),
                            title: const Text(
                              "Dart Quiz",
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text('Start Dart Quiz'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Quiz3Page(quiz3Bloc: widget.quiz3Bloc),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Container(
                              height: MediaQuery.of(context).size.height / 7,
                              child: Image.asset('assets/gk.jpg'),
                            ),
                            title: Text(
                              "General Knowledge Quiz",
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text('Start this quiz'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height:
                      16.0), // Add spacing between the GridView and the FloatingActionButton
            ],
          ),
        ),
      ),
    );
  }
}
