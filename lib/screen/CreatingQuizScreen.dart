// ignore_for_file: file_names, use_key_in_widget_constructors, unused_local_variable, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire/homescreen.dart';
import 'package:questionnaire/studentSignin.dart';
import 'package:questionnaire/style/app_color.dart';
import 'package:questionnaire/widget/RSTextFormField.dart';
import 'package:questionnaire/widget/SmallUnderline.dart';
import 'package:questionnaire/widget/text/WhiteText.dart';

final questionController = <TextEditingController>[];
final answerController = <TextEditingController>[];
final aAnswerController = <TextEditingController>[];
final bAnswerController = <TextEditingController>[];
final cAnswerController = <TextEditingController>[];
final dAnswerController = <TextEditingController>[];

class CreatingQuizScreen extends StatefulWidget {
  final String numberQuestion;
  final String quizName;
  final String quizId;
  final String studentQuestion;
  final String startDay;
  final String endDay;
  final String duration;

  const CreatingQuizScreen(
      {required this.numberQuestion,
      required this.quizId,
      required this.quizName,
      required this.studentQuestion,
      required this.startDay,
      required this.endDay,
      required this.duration});

  @override
  State<CreatingQuizScreen> createState() => _CreatingQuizScreenState();
}

class _CreatingQuizScreenState extends State<CreatingQuizScreen> {
  @override
  Widget build(BuildContext context) {
    final studentQuestionVar = int.parse(widget.studentQuestion);
    final startDayVar = widget.startDay;
    final endDayVar = widget.endDay;
    final durationVar = widget.duration;
    final question = int.parse(widget.numberQuestion);
    final idQuiz = widget.quizId;
    final nameQuiz = widget.quizName;
    // int number;
    final questionAddList = [];

    //  dynamic postData = [];

    dynamic postQuiz = [];
    Future postQuestion() async {
      for (int i = 0; i < question; i++) {
        questionAddList.add(i);
      }
      print('question $questionAddList');

      var collection = FirebaseFirestore.instance.collection('teacher');
      var docSnapshot = await collection.doc('VbWzEnRYiyi4TJB0yfBs').get();
      Map<String, dynamic>? data = docSnapshot.data();
      print(questionController[0].text);
      if (docSnapshot.exists) {
        // if (data!['quiz'] != null) {
        //   postQuiz = data['quiz'];
        //   print(postQuiz.length);

        //   postQuiz.add({
        //     "quiz_id": idQuiz,
        //     "quiz_name": nameQuiz,
        //     "quiz_duration": durationVar,
        //     "quiz_startday": startDayVar,
        //     "quiz_endday": endDayVar,
        //     "quiz_studentquestion": studentQuestionVar,
        //     "quiz_questions": questionAddList
        //         .map((i) => {
        //               "question_title": questionController[i].text,
        //               "questions": [
        //                 {
        //                   "a_answer": aAnswerController[i].text,
        //                   "isCorrect": answerController[i].text == 'a' ||
        //                           answerController[i].text == 'A'
        //                       ? true
        //                       : false,
        //                 },
        //                 {
        //                   "b_answer": bAnswerController[i].text,
        //                   "isCorrect": answerController[i].text == 'b' ||
        //                           answerController[i].text == 'B'
        //                       ? true
        //                       : false,
        //                 },
        //                 {
        //                   "c_answer": cAnswerController[i].text,
        //                   "isCorrect": answerController[i].text == 'c' ||
        //                           answerController[i].text == 'C'
        //                       ? true
        //                       : false,
        //                 },
        //                 {
        //                   "d_answer": dAnswerController[i].text,
        //                   "isCorrect": answerController[i].text == 'd' ||
        //                           answerController[i].text == 'D'
        //                       ? true
        //                       : false,
        //                 },
        //               ]
        //             })
        //         .toList()
        //   });

        //   print(postQuiz[0]['quiz_questions']);
        //   final dataList = [];

        //   for (int i = 0; i < postQuiz.length; i++) {
        //     dataList.add(i);
        //   }
        //   print(dataList);
        //   // "student_name": postData[e]['student_name'],

        //   FirebaseFirestore.instance
        //       .collection('teacher')
        //       .doc('VbWzEnRYiyi4TJB0yfBs')
        //       .set({
        //     "quiz": dataList
        //         .map((e) => {
        //               {
        //                 "quiz_id": postQuiz[e]['quiz_id'],
        //                 "quiz_name": postQuiz[e]['quiz_name'],
        //                 "quiz_questions": postQuiz[e]['quiz_questions']
        //               }
        //             })
        //         .toList(),
        //     // "students": data[students],
        //   }, SetOptions(merge: true));
        // } else {
          FirebaseFirestore.instance
              .collection('teacher')
              .doc('VbWzEnRYiyi4TJB0yfBs')
              .set({
            "quiz": [
              {
                "quiz_id": idQuiz,
                "quiz_name": nameQuiz,
                "quiz_duration": durationVar,
                "quiz_startday": startDayVar,
                "quiz_endday": endDayVar,
                "quiz_studentquestion": studentQuestionVar,
                "quiz_questions": questionAddList
                    .map((i) => {
                          "question_title": questionController[i].text,
                          "questions": [
                            {
                              "a_answer": aAnswerController[i].text,
                              "isCorrect": answerController[i].text == 'a' ||
                                      answerController[i].text == 'A'
                                  ? true
                                  : false,
                            },
                            {
                              "b_answer": bAnswerController[i].text,
                              "isCorrect": answerController[i].text == 'b' ||
                                      answerController[i].text == 'B'
                                  ? true
                                  : false,
                            },
                            {
                              "c_answer": cAnswerController[i].text,
                              "isCorrect": answerController[i].text == 'c' ||
                                      answerController[i].text == 'C'
                                  ? true
                                  : false,
                            },
                            {
                              "d_answer": dAnswerController[i].text,
                              "isCorrect": answerController[i].text == 'd' ||
                                      answerController[i].text == 'D'
                                  ? true
                                  : false,
                            },
                          ]
                        })
                    .toList()
              }
            ],
            "students": [],
          }, SetOptions(merge: true));
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      }
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
    // }

    return Scaffold(
      backgroundColor: cPrimary,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
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
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                WhiteText(
                    text: 'Create Quiz', fontWeight: FontWeight.bold, size: 25),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: question,
                    itemBuilder: ((context, index) {
                      return questionList(index);
                    }))),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextButton(
                  onPressed: postQuestion,
                  child: const Text(
                    "Add",
                    style: TextStyle(fontSize: 16, color: cPrimary),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 255)),
                    foregroundColor: MaterialStateProperty.all(cPrimary),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            side: BorderSide(
                              color: Colors.white,
                            ))),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

Widget questionList(int index) {
  if (questionController.length <= index) {
    questionController.add(TextEditingController());
    answerController.add(TextEditingController());
    aAnswerController.add(TextEditingController());
    bAnswerController.add(TextEditingController());
    cAnswerController.add(TextEditingController());
    dAnswerController.add(TextEditingController());
    
  }

  return Column(
    children: [
      RSTextFormField(
        mainColor: Colors.white,
        textColor: Colors.white,
        controller: questionController[index],
        labelText: 'question',
        prefixIcon: Image.asset(
          'assets/question_icon.png',
          height: 12,
          width: 12,
        ),
        labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      SizedBox(
        height: 30,
      ),
      RSTextFormField(
        mainColor: Colors.white,
        textColor: Colors.white,
        controller: aAnswerController[index],
        labelText: 'answer a',
        prefixIcon: Image.asset(
          'assets/a_icon.png',
          height: 12,
          width: 12,
        ),
        labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      RSTextFormField(
        mainColor: Colors.white,
        textColor: Colors.white,
        controller: bAnswerController[index],
        labelText: 'answer b',
        prefixIcon: Image.asset(
          'assets/b_icon.png',
          height: 12,
          width: 12,
        ),
        labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      RSTextFormField(
        mainColor: Colors.white,
        textColor: Colors.white,
        controller: cAnswerController[index],
        labelText: 'answer c',
        prefixIcon: Image.asset(
          'assets/c_icon.png',
          height: 12,
          width: 12,
        ),
        labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      RSTextFormField(
        mainColor: Colors.white,
        textColor: Colors.white,
        controller: dAnswerController[index],
        labelText: 'answer d',
        prefixIcon: Image.asset(
          'assets/d_icon.png',
          height: 12,
          width: 12,
        ),
        labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      SizedBox(
        height: 30,
      ),
      RSTextFormField(
        mainColor: Colors.white,
        textColor: Colors.white,
        controller: answerController[index],
        labelText: 'correct answer with a,b,c,d',
        prefixIcon: Image.asset(
          'assets/correct_AnsIcon.png',
          height: 12,
          width: 12,
        ),
        labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      SizedBox(
        height: 20,
      ),
      SmallUnderline(),
      SizedBox(
        height: 50,
      ),
    ],
  );
}
