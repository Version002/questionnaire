import 'package:flutter/material.dart';
import 'package:questionnaire/style/app_color.dart';
import 'package:questionnaire/widget/text/BlackText.dart';
import 'package:questionnaire/widget/text/WhiteText.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({Key? key}) : super(key: key);

  @override
  State<ReportingScreen> createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  List score = [
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: cPrimary,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
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
                            WhiteText(
                                text: 'Reporting',
                                fontWeight: FontWeight.bold,
                                size: 25),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 280,
                ),
                Positioned(
                  top: 140,
                  left: MediaQuery.of(context).size.width * 0.35,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffBF82FF),
                      borderRadius: BorderRadius.circular(120),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/avatar.png',
                        height: 90,
                        width: 90,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BlackText(
                text: 'Rober John Son', fontWeight: FontWeight.w800, size: 25),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: cPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/test_icon.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            WhiteText(
                                text: 'tests',
                                fontWeight: FontWeight.w300,
                                size: 15),
                            SizedBox(
                              height: 15,
                            ),
                            WhiteText(
                                text: '25',
                                fontWeight: FontWeight.w700,
                                size: 22)
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 1,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/student_icon.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            WhiteText(
                                text: 'student',
                                fontWeight: FontWeight.w300,
                                size: 15),
                            SizedBox(
                              height: 15,
                            ),
                            WhiteText(
                                text: '25',
                                fontWeight: FontWeight.w700,
                                size: 22)
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BlackText(
                          text: 'Students Scoring',
                          fontWeight: FontWeight.w500,
                          size: 20),
                    ],
                  ),
                  Text(
                    'Export',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SizedBox(width: 30),
                  Container(
                    width: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: score.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Angelina',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(width: 50),
                  Container(
                    width: 90,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: score.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '100 Pt',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }),
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
