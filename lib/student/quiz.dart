import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../style/app_color.dart';

Map<String, dynamic>? data;
String? hours;
String? minutes;
String? second;
Duration dif = Duration(minutes: 15);
Timer? countdownTimer;
String strDigits(int n) => n.toString().padLeft(2, '0');

Future retrieveQuestion() async {
  var collection = FirebaseFirestore.instance.collection('teacher');
  var docSnapshot = await collection.doc('tDBJb5RjZVT4NTvD9W7D').get();
  if (docSnapshot.exists) {
    data = docSnapshot.data();
    print(data);
    if (data?['quiz'] != null) {
      print('true');
    }
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      questionWidget(),

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
  const questionWidget({Key? key}) : super(key: key);

  @override
  State<questionWidget> createState() => _questionWidgetState();
}

class _questionWidgetState extends State<questionWidget> {
  int correctAnswers = 0;
  // bool isCorrect = false;
  // List<List<bool>> isCorrect = [];
   List<List<bool>> isCorrect = List.generate(data!.length, (i) => List.filled(4, false, growable: false), growable: false);
  
  
  @override
  Widget build(BuildContext context) {
    print(isCorrect);
    return Column(
      children: [
        Container(
          height: 3000,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data!.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                // isCorrect[index]=[false, false, false, false];
                // print(data!.length);
                // List<bool> isCorrect[index] = [false, false, false, false];

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
                            if (isCorrect[index][0] ==
                                data!['quiz'][0]['quiz_questions'][index]
                                    ['questions'][0]['isCorrect']) {
                              ++correctAnswers;
                            }
                            print(correctAnswers);
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
                            if (isCorrect[index][1] ==
                                data!['quiz'][0]['quiz_questions'][index]
                                    ['questions'][1]['isCorrect']) {
                              ++correctAnswers;
                            }
                            print(correctAnswers);
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
                            if (isCorrect[index][2] ==
                                data!['quiz'][0]['quiz_questions'][index]
                                    ['questions'][2]['isCorrect']) {
                              ++correctAnswers;
                            }
                            print(correctAnswers);
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
                            if (isCorrect[index][3] ==
                                data!['quiz'][0]['quiz_questions'][index]
                                    ['questions'][3]['isCorrect']) {
                              ++correctAnswers;
                            }
                            print(correctAnswers);
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
        // Padding(
        //   padding: const EdgeInsets.only(top: 32.0),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width * 0.7,
        //     child: TextButton(
        //       onPressed: () {},
        //       child: const Text(
        //         "End",
        //         style: TextStyle(fontSize: 16, color: cPrimary),
        //       ),
        //       style: ButtonStyle(
        //         backgroundColor: MaterialStateProperty.all(
        //             const Color.fromARGB(255, 255, 255, 255)),
        //         foregroundColor: MaterialStateProperty.all(cPrimary),
        //         shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //             side: BorderSide(
        //               color: Colors.white,
        //             ))),
        //       ),
        //     ),
        //   ),
        // )
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 13.5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(width: 1, color: Colors.white)),
      child: const Text(
        "#  10",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
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
