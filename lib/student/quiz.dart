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
        print(dif);
        minutes = strDigits(dif.inMinutes.remainder(60));
        second = strDigits(dif.inSeconds.remainder(60));
      });
    });

    print(countdownTimer);
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
  @override
  Widget build(BuildContext context) {
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
                print(data!.length);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "In which city of Cambodia is the largest part?",
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
                          onPressed: () {},
                          child: const Text(
                            "Phnom Penh",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
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
                          onPressed: () {},
                          child: const Text(
                            "Kompong Cham",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
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
                          onPressed: () {},
                          child: const Text(
                            "Siem Reap",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
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
                          onPressed: () {},
                          child: const Text(
                            "Sihanoukville",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
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
