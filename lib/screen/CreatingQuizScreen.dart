import 'package:flutter/material.dart';
import 'package:questionnaire/style/app_color.dart';
import 'package:questionnaire/widget/RSTextFormField.dart';
import 'package:questionnaire/widget/SmallUnderline.dart';
import 'package:questionnaire/widget/text/WhiteText.dart';

class CreatingQuizScreen extends StatefulWidget {
  const CreatingQuizScreen({Key? key}) : super(key: key);

  @override
  State<CreatingQuizScreen> createState() => _CreatingQuizScreenState();
}

class _CreatingQuizScreenState extends State<CreatingQuizScreen> {
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 50,),
            RSTextFormField(
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
              labelText: 'question',
              prefixIcon: Image.asset(
                'assets/question_icon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 30,),
            RSTextFormField(
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
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
              // controller: state.firstname,
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
              // controller: state.firstname,
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
              // controller: state.firstname,
              labelText: 'answer d',
              prefixIcon: Image.asset(
                'assets/d_icon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 30,),
            RSTextFormField(
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
              labelText: 'correct answer',
              prefixIcon: Image.asset(
                'assets/correct_AnsIcon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 20,),
            SmallUnderline(),

            SizedBox(height: 50,),
            RSTextFormField(
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
              labelText: 'question',
              prefixIcon: Image.asset(
                'assets/question_icon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 30,),
            RSTextFormField(
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
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
              // controller: state.firstname,
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
              // controller: state.firstname,
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
              // controller: state.firstname,
              labelText: 'answer d',
              prefixIcon: Image.asset(
                'assets/d_icon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 30,),
            RSTextFormField(
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
              labelText: 'correct answer',
              prefixIcon: Image.asset(
                'assets/correct_AnsIcon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 20,),
            SmallUnderline(),



            SizedBox(height: 50,),
            RSTextFormField(
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
              labelText: 'question',
              prefixIcon: Image.asset(
                'assets/question_icon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 30,),
            RSTextFormField(
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
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
              // controller: state.firstname,
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
              // controller: state.firstname,
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
              // controller: state.firstname,
              labelText: 'answer d',
              prefixIcon: Image.asset(
                'assets/d_icon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 30,),
            RSTextFormField(
              mainColor: Colors.white,
              textColor: Colors.white,
              // controller: state.firstname,
              labelText: 'correct answer',
              prefixIcon: Image.asset(
                'assets/correct_AnsIcon.png',
                height: 12,
                width: 12,
              ),
              labelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 20,),
            SmallUnderline(),
          ],
        ),
      )),
    );
  }
}
