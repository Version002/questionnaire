import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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


// final quizController = [
//   {
//     questionController: TextEditingController(), 
//     answerController: [
//       TextEditingController(), 
//             TextEditingController(), 

//       TextEditingController(), 

//       TextEditingController(), 

//     ]
//   }, 
//   {

//   },
//   {

//   }, 
//   {

//   }, 
// ]

class CreatingQuizScreen extends StatefulWidget {
  final String numberQuestion;
  final String quizName;
  final String quizId;

  CreatingQuizScreen(
      {required this.numberQuestion,
      required this.quizId,
      required this.quizName});

  @override
  State<CreatingQuizScreen> createState() => _CreatingQuizScreenState();
}

class _CreatingQuizScreenState extends State<CreatingQuizScreen> {
  @override
  Widget build(BuildContext context) {
    final question = int.parse(widget.numberQuestion);
    final idQuiz = widget.quizId;
    final nameQuiz = widget.quizName;
    int number;

    Future postQuestion() async {
      var collection = FirebaseFirestore.instance.collection('teacher');
      var docSnapshot = await collection.doc('tDBJb5RjZVT4NTvD9W7D').get();
      print(questionController[0].text);
      if (docSnapshot.exists) {
        Map<String, dynamic>? data = docSnapshot.data();
        FirebaseFirestore.instance
            .collection('teacher')
            .doc('tDBJb5RjZVT4NTvD9W7D')
            .set({
          "quiz": [
            {
              "quiz_id": idQuiz,
              "quiz_name": nameQuiz,
              "quiz_questions": [
                for(int i = 0; i<question;i++){
                   {
                  "question_title": questionController[i].text,
                  "questions": [
                    {
                      "a_answer": aAnswerController[i].text,
                      "isCorrect": true,
                    },
                    {
                      "b_answer": bAnswerController[i].text,
                      "isCorrect": false,
                    },
                    {
                      "c_answer": cAnswerController[i].text,
                      "isCorrect": true,
                    },
                    {
                      "d_answer": dAnswerController[i].text,
                      "isCorrect": false,
                    },
                  ]
                }
                }
               
              ]
            }
          ]
        }, SetOptions(merge: true));
      }
    }

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
