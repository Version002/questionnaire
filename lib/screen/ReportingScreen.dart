import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire/homescreen.dart';
import 'package:questionnaire/screen/AddingQuizScreen.dart';
import 'package:questionnaire/style/app_color.dart';
import 'package:questionnaire/widget/text/BlackText.dart';
import 'package:questionnaire/widget/text/WhiteText.dart';
import 'package:csv/csv.dart';
import 'package:external_path/external_path.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({Key? key}) : super(key: key);

  @override
  State<ReportingScreen> createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  @override
  void initState() {
    fetchDocuments();
    super.initState();
  }

  var collection;
  var docSnapshot;
  var number;
  var student;
  var teacher;
  bool loading = true;
  Map<String, dynamic>? data;
  Future<dynamic> fetchDocuments() async {
    collection = FirebaseFirestore.instance.collection('teacher');
    docSnapshot = await collection.doc('tDBJb5RjZVT4NTvD9W7D').get();
    data = await docSnapshot.data()!;
    student = data!['students'];
    teacher = data!['email'];
  }

  List<dynamic> studentScore = [];

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
    // fetchDocuments();
    setState(() {
      if(student==null){
        loading=true;
      }else{
        loading =false;
      }
    });
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
                text: teacher.toString(),
                fontWeight: FontWeight.w800,
                size: 25),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
                                text: student?.length.toString() ?? 'Empty',
                                fontWeight: FontWeight.w700,
                                size: 22)
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
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
                  TextButton(
                    onPressed: _generateCsvFile,
                    child: Text(
                      'Export',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  )

                  // Text(
                  //   'Export',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 20,
                  //     color: Colors.red,
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34.0),
              child: Row(
                children: [
                  // SizedBox(width: 30),
                  LayoutBuilder(builder: (context, constraints) {
                    if (loading=true) {
                     
                      return Center(
                          child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1),
                        child: CircularProgressIndicator(),
                      ));
                    }

                    else {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: student?.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              number = index;

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15.0),
                                        child: Text(
                                          student?[index]['student_name']
                                                  .toString() ??
                                              'Empty',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        student?[index]['student_score']
                                                .toString() ??
                                            'Empty',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              );
                            }),
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _generateCsvFile() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses[Permission.storage]);

    List<List<dynamic>> rows = [];

    List<dynamic> row = [];
    row.add("name");
    row.add("score");
    rows.add(row);

    for (int i = 0; i <= number; i++) {
      studentScore.add(
        {
          "name": docSnapshot?.data()!['students'][i]['student_name'],
          "score": docSnapshot?.data()!['students'][i]['student_score']
        },
      );
    }

    for (int i = 0; i < studentScore.length; i++) {
      List<dynamic> row = [];
      row.add(studentScore[i]["name"]);
      row.add(studentScore[i]["score"]);
      rows.add(row);
    }

    String csv = const ListToCsvConverter().convert(rows);

    String dir = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    print("dir $dir");
    String file = "$dir";

    File f = File(file + "/filename.csv");

    f.writeAsString(csv);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Export To CSV"),
        content: Text("You have success in exporting file"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }
}
