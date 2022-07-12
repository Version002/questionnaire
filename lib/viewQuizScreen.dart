import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:questionnaire/main.dart';
import 'package:questionnaire/studentSignin.dart';
import 'package:questionnaire/style/app_color.dart';
import 'package:questionnaire/widget/text/BlackText.dart';

var quiz;
bool isloaded = false;

class ViewQuizScreen extends StatefulWidget {
  const ViewQuizScreen({Key? key}) : super(key: key);

  @override
  State<ViewQuizScreen> createState() => _ViewQuizScreenState();
}

class _ViewQuizScreenState extends State<ViewQuizScreen> {
  Future<dynamic> fetchDocuments() async {
    collection = FirebaseFirestore.instance.collection('teacher');
    docSnapshot = await collection.doc('VbWzEnRYiyi4TJB0yfBs').get();

    data = await docSnapshot.data()!;
    quiz = data!['quiz'][0];
    print(data!['quiz'][0]['quiz_questions'].length);
    print(data!['quiz'][0]['quiz_questions'][0]['question_title']);
    setState(() {
      quiz;
      isloaded = true;
    });
  }

  @override
  void initState() {
    fetchDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloaded == false
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: cPrimary,
                                      borderRadius: BorderRadius.circular(120),
                                      border: Border.all(color: Colors.white)),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/backward_icon.png',
                                      height: 18,
                                      width: 18,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Text(
                                'Reporting',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: cPrimary,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30,),
                          Text(
                            'Quiz Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: cPrimary,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: BlackText(
                                    text: 'Quiz Name: ',
                                    fontWeight: FontWeight.w400,
                                    size: 15),
                              ),
                              BlackText(
                                  text: data!['quiz'][0]['quiz_name'],
                                  fontWeight: FontWeight.w400,
                                  size: 15),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: BlackText(
                                    text: 'Quiz ID: ',
                                    fontWeight: FontWeight.w400,
                                    size: 15),
                              ),
                              BlackText(
                                  text: data!['quiz'][0]['quiz_id'],
                                  fontWeight: FontWeight.w400,
                                  size: 15),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: BlackText(
                                    text: 'Quiz Duration: ',
                                    fontWeight: FontWeight.w400,
                                    size: 15),
                              ),
                              BlackText(
                                  text: data!['quiz'][0]['quiz_duration'],
                                  fontWeight: FontWeight.w400,
                                  size: 15),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: BlackText(
                                    text: 'Quiz Start Day: ',
                                    fontWeight: FontWeight.w400,
                                    size: 15),
                              ),
                              BlackText(
                                  text: data!['quiz'][0]['quiz_startday'],
                                  fontWeight: FontWeight.w400,
                                  size: 15),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: BlackText(
                                    text: 'Quiz End Day:',
                                    fontWeight: FontWeight.w400,
                                    size: 15),
                              ),
                              BlackText(
                                  text: data!['quiz'][0]['quiz_endday'],
                                  fontWeight: FontWeight.w400,
                                  size: 15),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: BlackText(
                                    text: 'Quiz Retake: ',
                                    fontWeight: FontWeight.w400,
                                    size: 15),
                              ),
                              BlackText(
                                  text: data!['quiz'][0]['quiz_multiTaking'] ==
                                          true
                                      ? "Yes"
                                      : "No",
                                  fontWeight: FontWeight.w400,
                                  size: 15),
                            ],
                          ),
                          SizedBox(height: 50),
                          Text(
                            'Quiz Questions',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: cPrimary,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    data!['quiz'][0]['quiz_questions'].length,
                                itemBuilder: ((context, index) {
                                  int number = index;
                                  ++number;
                                  String i = number.toString();

                                  return Column(children: [
                                    Row(
                                      children: [
                                        BlackText(
                                            text: '$i. ',
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                        BlackText(
                                            text: data!['quiz'][0]
                                                    ['quiz_questions'][index]
                                                ['question_title'],
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        BlackText(
                                            text: 'A. ',
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                        BlackText(
                                            text: data!['quiz'][0]
                                                    ['quiz_questions'][index]
                                                ['questions'][0]['a_answer'],
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        BlackText(
                                            text: data!['quiz'][0][
                                                                'quiz_questions']
                                                            [index]['questions']
                                                        [0]['isCorrect'] ==
                                                    true
                                                ? 'Correct'
                                                : '',
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        BlackText(
                                            text: 'B. ',
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                        BlackText(
                                            text: data!['quiz'][0]
                                                    ['quiz_questions'][index]
                                                ['questions'][1]['b_answer'],
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        BlackText(
                                            text: data!['quiz'][0][
                                                                'quiz_questions']
                                                            [index]['questions']
                                                        [1]['isCorrect'] ==
                                                    true
                                                ? 'Correct'
                                                : '',
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        BlackText(
                                            text: 'C. ',
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                        BlackText(
                                            text: data!['quiz'][0]
                                                    ['quiz_questions'][index]
                                                ['questions'][2]['c_answer'],
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        BlackText(
                                            text: data!['quiz'][0][
                                                                'quiz_questions']
                                                            [index]['questions']
                                                        [2]['isCorrect'] ==
                                                    true
                                                ? 'Correct'
                                                : '',
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        BlackText(
                                            text: 'D. ',
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                        BlackText(
                                            text: data!['quiz'][0]
                                                    ['quiz_questions'][index]
                                                ['questions'][3]['d_answer'],
                                            fontWeight: FontWeight.w400,
                                            size: 15),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        BlackText(
                                            text: data!['quiz'][0][
                                                                'quiz_questions']
                                                            [index]['questions']
                                                        [3]['isCorrect'] ==
                                                    true
                                                ? 'Correct Answer'
                                                : '',
                                            fontWeight: FontWeight.bold,
                                            size: 15),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ]);
                                }),
                              ))
                        ]))));
  }
}
