import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:questionnaire/screen/CreatingQuizScreen.dart';
import 'package:questionnaire/widget/RSTextFormField.dart';
import 'package:questionnaire/widget/text/WhiteText.dart';

import '../style/app_color.dart';

class AddingQuizScreen extends StatefulWidget {
  const AddingQuizScreen({Key? key}) : super(key: key);

  @override
  State<AddingQuizScreen> createState() => _AddingQuizScreenState();
}

class _AddingQuizScreenState extends State<AddingQuizScreen> {
  final quizNameController = TextEditingController();
  final quizIdController = TextEditingController();
  final numberQuestionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future addData() async {
      if (quizIdController.text != null &&
              quizNameController.text != null && numberQuestionController.text!=null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreatingQuizScreen(numberQuestion: numberQuestionController.text,quizId: quizIdController.text,quizName: quizNameController.text,)));
          }
    }
    // Future retrieveData() async {
    //   var collection = FirebaseFirestore.instance.collection('teacher');
    //   var docSnapshot = await collection.doc('ETX2Cdra8r4he1ElSrwC').get();
    //   if (docSnapshot.exists) {
    //     // final data = docSnapshot.data();
    //     Map<String, dynamic>? data = docSnapshot.data();
        
    //     if (data?['quiz'] == null) {
    //       FirebaseFirestore.instance
    //           .collection('teacher')
    //           .doc('tDBJb5RjZVT4NTvD9W7D')
    //           .set({
    //         "quiz": [
    //           {
    //             'quizId': quizIdController.text,
    //             'quizName': quizNameController.text,
    //           }
    //         ]
    //       }, SetOptions(merge: true));
          
    //     } else {
    //       print('yes');
    //       print(data?['quiz'][0]['quizId']);
    //       if (quizIdController.text != null &&
    //           quizNameController.text != null && numberQuestionController.text!=null) {
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => CreatingQuizScreen(numberQuestion: numberQuestionController.text,quizId: quizIdController.text,quizName: quizNameController.text,)));
    //       }
    //       //condition second array
    //       // final json = {
    //       //   'quizId': quizIdController.text,
    //       //   'quizName': quizNameController.text,
    //       // };
    //       // FirebaseFirestore.instance
    //       //     .collection('teacher')
    //           // .doc('tDBJb5RjZVT4NTvD9W7D')
    //           // .updateData({"quiz": FieldValue.arrayUnion(json) });
    //       // Firestore.instance.collection(city).document('Attractions').updateData({"data": FieldValue.arrayUnion(obj)});
    //     }
    //   }
    //   print(docSnapshot.data());
    //   print(docSnapshot.data()!['quiz'][0]['students'].length);
    //   // print(data?['quiz']);
    // }

    return Scaffold(
      backgroundColor: cPrimary,
      body: Padding(
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
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                WhiteText(
                    text: 'Quiz Information',
                    fontWeight: FontWeight.bold,
                    size: 25),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            RSTextFormField(
              controller: quizNameController,
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
              labelText: 'quiz name',
              prefixIcon: Image.asset(
                'assets/question_icon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            RSTextFormField(
              controller: quizIdController,
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
              labelText: 'quiz id',
              prefixIcon: Image.asset(
                'assets/question_icon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
              RSTextFormField(
              keyboardType: TextInputType.number,
              controller: numberQuestionController,
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
              labelText: 'number of questions',
              prefixIcon: Image.asset(
                'assets/question_icon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextButton(
                  onPressed: addData,
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
      ),
    );
  }
}
