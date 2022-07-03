import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire/studentSignin.dart';
import 'dart:async';
import '../style/app_color.dart';

Map<String, dynamic>? data;
String? hours;
String? minutes;
String? second;
Duration dif = Duration(minutes: 1);
Timer? countdownTimer;
String strDigits(int n) => n.toString().padLeft(2, '0');
int screen = 0;
int correctAnswers = 0;
String studentUserName = '';

Future retrieveQuestion() async {
  var collection = FirebaseFirestore.instance.collection('teacher');
  var docSnapshot = await collection.doc('tDBJb5RjZVT4NTvD9W7D').get();
  if (docSnapshot.exists) {
    data = docSnapshot.data();
    // print(data);
    if (data?['quiz'] != null) {
      print('true');
    }
  }
}

class QuizScreen extends StatefulWidget {
  final String studentName;

  QuizScreen({
    required this.studentName,
  });
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  loadTimer() {
    // countdownTimer?.cancel();
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      final reduceSecondsBy = 1;
      setState(() {
        final seconds = dif.inSeconds - reduceSecondsBy;
        dif = Duration(seconds: seconds);
        // print(dif);

        minutes = strDigits(dif.inMinutes.remainder(60));
        second = strDigits(dif.inSeconds.remainder(60));
        if (seconds < 1) {
          countdownTimer!.cancel();
        }
      });
    });

    // print(countdownTimer);
  }

  @override
  void initState() {
    dif = Duration(minutes: 1);
    screen=0;
    retrieveQuestion();
    loadTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    studentUserName = widget.studentName;

    setState(() {
      screen;
    });
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 106, 91, 226),
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: ((context, constraints) {
              if (data?['quiz'] == null) {
                return Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: CircularProgressIndicator(),
                ));
              }
              if (data?['quiz'].length == 0) {
                return Container();
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CancelButton(),
                            Text(
                              "$minutes : $second",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                            QuizNumber(),
                          ],
                        ),
                      ),
                      // questionWidget(),
                      if (screen == 0) ...[
                        questionWidget(),
                      ] else ...[
                        ScoreReview(),
                      ]

                      // gonna do streambuilder for the answers later
                    ],
                  ),
                );
              }
            }),
          ),
        ));
  }
}

class questionWidget extends StatefulWidget {
  questionWidget({Key? key}) : super(key: key);

  @override
  State<questionWidget> createState() => _questionWidgetState();
}

class _questionWidgetState extends State<questionWidget> {
  int number = 0;

  List<List<bool>> isCorrect = List.generate(
      data!.length, (i) => List.filled(4, false, growable: false),
      growable: false);

  @override
  Widget build(BuildContext context) {
    print(isCorrect);
    return Column(
      children: [
        Container(
          height: 500*data!['quiz'][0]['quiz_questions'].length*1.0,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data!['quiz'][0]['quiz_questions'].length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                number = index;
          
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data!['quiz'][0]['quiz_questions'][index]
                          ['question_title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isCorrect[index] = [true, false, false, false];
                            });
                          },
                          child: Text(
                            data!['quiz'][0]['quiz_questions'][index]
                                ['questions'][0]['a_answer'],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: isCorrect[index][0] == true
                                ? MaterialStateProperty.all(Colors.yellow[300])
                                : MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 106, 91, 226)),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 106, 91, 226),
                                    ))),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isCorrect[index] = [false, true, false, false];
                            });
                          },
                          child: Text(
                            data!['quiz'][0]['quiz_questions'][index]
                                ['questions'][1]['b_answer'],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: isCorrect[index][1] == true
                                ? MaterialStateProperty.all(Colors.yellow[300])
                                : MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 106, 91, 226)),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 106, 91, 226),
                                    ))),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isCorrect[index] = [false, false, true, false];
                            });
                          },
                          child: Text(
                            data!['quiz'][0]['quiz_questions'][index]
                                ['questions'][2]['c_answer'],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: isCorrect[index][2] == true
                                ? MaterialStateProperty.all(Colors.yellow[300])
                                : MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 106, 91, 226)),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 106, 91, 226),
                                    ))),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isCorrect[index] = [false, false, false, true];
                            });
                          },
                          child: Text(
                            data!['quiz'][0]['quiz_questions'][index]
                                ['questions'][3]['d_answer'],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: isCorrect[index][3] == true
                                ? MaterialStateProperty.all(Colors.yellow[300])
                                : MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 106, 91, 226)),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 106, 91, 226),
                                    ))),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextButton(
              onPressed: () {
                correctAnswers = 0;
                for (int i = 0; i <= number; i++) {
                  for (int j = 0; j < 4; j++) {
                    if (data!['quiz'][0]['quiz_questions'][i]['questions'][j]
                                ['isCorrect'] ==
                            true &&
                        isCorrect[i][j] == true) {
                      ++correctAnswers;
                    }
                  }
                }

                print(correctAnswers);
                setState(() {
                  screen = 1;

                });
                
              },
              child: const Text(
                "End",
                style: TextStyle(fontSize: 16, color: cPrimary),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 255, 255, 255)),
                foregroundColor: MaterialStateProperty.all(cPrimary),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    side: BorderSide(
                      color: Colors.white,
                    ))),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class QuizNumber extends StatelessWidget {
  const QuizNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentSignin()));
        },
        icon: Icon(
          Icons.logout,
          color: Colors.white,
        ));
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pop();
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 1,
                color: Colors.white,
              )),
          child: const Icon(
            Icons.close_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}

class ScoreReview extends StatefulWidget {
  const ScoreReview({Key? key}) : super(key: key);

  @override
  State<ScoreReview> createState() => _ScoreReviewState();
}

class _ScoreReviewState extends State<ScoreReview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PurpleContainer(),
        // PinkContainer(),
        RetakeButton(),
        SizedBox(
          height: 30,
        ),

        Text(
          "or",
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
        EndQuizButton(),
      ],
    );
  }
}

class RetakeButton extends StatefulWidget {
  const RetakeButton({
    Key? key,
  }) : super(key: key);

  @override
  State<RetakeButton> createState() => _RetakeButtonState();
}

class _RetakeButtonState extends State<RetakeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TextButton(
          onPressed: () {
            setState(() {
              screen = 0;
            });
          },
          child: const Text(
            "Retake",
            style: TextStyle(fontSize: 16),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 106, 91, 226)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                side: BorderSide(
                  color: Colors.white,
                ))),
          ),
        ),
      ),
    );
  }
}

class EndQuizButton extends StatefulWidget {
  const EndQuizButton({
    Key? key,
  }) : super(key: key);

  @override
  State<EndQuizButton> createState() => _EndQuizButtonState();
}

class _EndQuizButtonState extends State<EndQuizButton> {
  dynamic postData = [];
  Future postScore() async {
    if (data!['students'] != null) {
      postData = data!['students'];

      postData.add({
        "student_name": studentUserName,
        "student_score": correctAnswers/data!['quiz'][0]['quiz_questions'].length*100,
      });
      final dataList = [];

      for (int i = 0; i < postData.length; i++) {
        dataList.add(i);
      }

      FirebaseFirestore.instance
          .collection('teacher')
          .doc('tDBJb5RjZVT4NTvD9W7D')
          .set({
        "students": dataList
            .map((e) => {
                  "student_name": postData[e]['student_name'],
                  "student_score": postData[e]['student_score'],
                })
            .toList(),
      }, SetOptions(merge: true));
    } else {
      FirebaseFirestore.instance
          .collection('teacher')
          .doc('tDBJb5RjZVT4NTvD9W7D')
          .set({
        "students": [
          {
          "student_name": studentUserName,
          "student_score": correctAnswers/data!['quiz'][0]['quiz_questions'].length*100,
        }
        ]
      }, SetOptions(merge: true));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TextButton(
          onPressed: postScore,
          child: const Text(
            "End",
            style: TextStyle(fontSize: 16),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 106, 91, 226)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                side: BorderSide(
                  color: Colors.white,
                ))),
          ),
        ),
      ),
    );
  }
}

class PurpleContainer extends StatelessWidget {
  const PurpleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.262,
        decoration: BoxDecoration(
          color: const Color(0xFF6A5BE2),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(width: 1, color: const Color(0xFF6A5BE2)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                child: const Text(
                  "QUIZ NAME",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                alignment: AlignmentDirectional.topStart,
                child:  Text(
                  data?['quiz'][0]['quiz_name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 115,
                decoration: BoxDecoration(
                  color: const Color(0xffFF8FA3),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                  border: Border.all(width: 1, color: const Color(0xffFF8FA3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            correctAnswers.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 28),
                          ),
                          Text(
                            "/100",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Positioned(
                            child: Image.asset(
                              'assets/trophy.png',
                              height: 80,
                              width: 80,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You got $correctAnswers",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.0),
                                child: Text(
                                  "out of 50",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pop();
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 1,
                color: Colors.black,
              )),
          child: const Icon(
            Icons.close_rounded,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }
}

class ScoreReviewText extends StatelessWidget {
  const ScoreReviewText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Score Review",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 23,
      ),
    );
  }
}
