import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire/main.dart';
import 'package:questionnaire/screen/AddingQuizScreen.dart';
// import 'package:questionnaire/screen/CreatingQuizScreen.dart';
import 'package:questionnaire/screen/ReportingScreen.dart';
import 'package:questionnaire/viewQuizScreen.dart';
import 'package:questionnaire/widget/text/BlackText.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlackText(
                    text: 'Hello,', fontWeight: FontWeight.w400, size: 25),
                IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    icon: Icon(Icons.logout)),
              ],
            ),
            BlackText(
                text: 'I hope you are doing well',
                fontWeight: FontWeight.w300,
                size: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddingQuizScreen()));
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFED1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFFED1),
                                    borderRadius: BorderRadius.circular(120),
                                    border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Image.asset(
                                    'assets/forward_icon.png',
                                    height: 18,
                                    width: 18,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              BlackText(
                                  text: 'Creating Quiz',
                                  fontWeight: FontWeight.bold,
                                  size: 23)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 110,
                    left: MediaQuery.of(context).size.width * 0.7,
                    child: Image.asset(
                      'assets/quiz.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewQuizScreen()));
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xffCFFED4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffCFFED4),
                                    borderRadius: BorderRadius.circular(120),
                                    border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Image.asset(
                                    'assets/forward_icon.png',
                                    height: 18,
                                    width: 18,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              BlackText(
                                  text: 'View Quiz',
                                  fontWeight: FontWeight.bold,
                                  size: 23)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 110,
                    left: MediaQuery.of(context).size.width * 0.7,
                    child: Image.asset(
                      'assets/dashboard.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReportingScreen()));
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xffFEE1CF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffFEE1CF),
                                    borderRadius: BorderRadius.circular(120),
                                    border: Border.all(color: Colors.black)),
                                child: Center(
                                  child: Image.asset(
                                    'assets/forward_icon.png',
                                    height: 18,
                                    width: 18,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              BlackText(
                                  text: 'Report',
                                  fontWeight: FontWeight.bold,
                                  size: 23)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 110,
                    left: MediaQuery.of(context).size.width * 0.7,
                    child: Image.asset(
                      'assets/report.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
