import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
// ignore_for_file: file_names, unnecessary_null_comparison

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
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
  bool _checkbox = false;
  DateTime dateTime = DateTime(2022, 11, 7, 5, 30);
  final quizNameController = TextEditingController();
  final quizIdController = TextEditingController();
  final numberQuestionController = TextEditingController();
  final numberQuesStuController = TextEditingController();
  final startDayController = TextEditingController();
  final endDayController = TextEditingController();
  final durationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.hour.toString().padLeft(2, '0');
    Future addData() async {
      if (quizIdController.text != null &&
          quizNameController.text != null &&
          numberQuestionController.text != null && numberQuesStuController.text != null && startDayController.text != null && endDayController.text !=null && durationController!= null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreatingQuizScreen(
                      numberQuestion: numberQuestionController.text,
                      quizId: quizIdController.text,
                      quizName: quizNameController.text,
                      studentQuestion: numberQuesStuController.text,
                      startDay: startDayController.text,
                      endDay: endDayController.text,
                      duration: durationController.text,
                      multi: _checkbox,
                    )));
      }
    }


    return Scaffold(
      backgroundColor: cPrimary,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
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
                keyboardType: TextInputType.number,
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
              // DateTimeField(
              //   format: format,
              //   onShowPicker: (context, currentValue) {
              //     return showDatePicker(
              //         context: context,
              //         firstDate: DateTime(1900),
              //         initialDate: currentValue ?? DateTime.now(),
              //         lastDate: DateTime(2100));
              //   },
              // ),
              RSTextFormField(
                keyboardType: TextInputType.number,
                controller: numberQuesStuController,
                mainColor: Colors.white,
                textColor: Colors.white,
                // controller: state.firstname,
                labelText: 'students question display',
                prefixIcon: Image.asset(
                  'assets/question_icon.png',
                  height: 12,
                  width: 12,
                ),
                labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              RSTextFormField(
                keyboardType: TextInputType.number,
                controller: durationController,
                mainColor: Colors.white,
                textColor: Colors.white,
                // controller: state.firstname,
                labelText: 'duration in minue',
                prefixIcon: Image.asset(
                  'assets/question_icon.png',
                  height: 12,
                  width: 12,
                ),
                labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              RSTextFormField(
                // onTap: () async {
                //   DateTime date = DateTime(1900);
                //   FocusScope.of(context).requestFocus(new FocusNode());

                //   date = (await showDatePicker(
                //       context: context,
                //       initialDate: DateTime.now(),
                //       firstDate: DateTime(2022),
                //       lastDate: DateTime(2050)))!;

                //   startDayController.text = date.toIso8601String();
                // },
                onTap: () async {
                  pickDateNTime();
                },
                keyboardType: TextInputType.number,
                controller: startDayController,
                mainColor: Colors.white,
                textColor: Colors.white,
                // controller: state.firstname,
                labelText: 'start date',
                prefixIcon: Image.asset(
                  'assets/question_icon.png',
                  height: 12,
                  width: 12,
                ),
                labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              RSTextFormField(
                onTap: ()async{
                  pickDateNTimeEnd();
                },
                keyboardType: TextInputType.number,
                controller: endDayController,
                mainColor: Colors.white,
                textColor: Colors.white,
                // controller: state.firstname,
                labelText: 'end date',
                prefixIcon: Image.asset(
                  'assets/question_icon.png',
                  height: 12,
                  width: 12,
                ),
                labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.white,
                        activeColor: cPrimary,
                      value: _checkbox,
                      onChanged: (value) {
                        setState(() {
                          _checkbox = !_checkbox;
                        });
                      },
                    ),
                    Text('multi taking',style: TextStyle(color: Colors.white),),

                  ],
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
              ),
        ]),
      ),
    ));
  }

  Future pickDateNTime() async {
    final date = await pickDate();
    if (date == null) return;
    setState(() {
      dateTime = date;
    });
    final time = await pickTime();
    final newDateTime = DateTime(
        dateTime.year, dateTime.month, dateTime.day, time!.hour, time.minute);
    setState(() {
      dateTime = newDateTime;
      print(newDateTime);
      String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(newDateTime);
      startDayController.text = formattedDate;
      print(startDayController.text);
    });
  }

  Future pickDateNTimeEnd() async {
    final date = await pickDate();
    if (date == null) return;
    setState(() {
      dateTime = date;
    });
    final time = await pickTime();
    final newDateTime = DateTime(
        dateTime.year, dateTime.month, dateTime.day, time!.hour, time.minute);
    setState(() {
      dateTime = newDateTime;
      print(newDateTime);
      String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(newDateTime);
      endDayController.text = formattedDate;
      print(endDayController.text);
    });
  }

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
  Future<DateTime?> pickDate() async {
    return showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2050));
  }
}
