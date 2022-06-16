import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:questionnaire/signin.dart';
// import 'package:questionnaire/homescreen.dart';
// import 'package:questionnaire/signin.dart';
import 'package:questionnaire/signup.dart';
import 'package:questionnaire/student/quiz.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizScreen(),
    );
  }
}
