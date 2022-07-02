import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:questionnaire/student/quiz.dart';

class StudentSignin extends StatelessWidget {
  const StudentSignin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  PurpleContainer(),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Logo(),
                      StudentLogin(),
                      UsernameForm(),
                      IdForm(),
                      StartButton(),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PurpleContainer extends StatelessWidget {
  PurpleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.195,
      color: Color.fromARGB(255, 106, 91, 226),
    );
  }
}

class Logo extends StatelessWidget {
  Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Image.asset(
        'assets/logo.png',
        height: 158,
        width: 190,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class StudentLogin extends StatelessWidget {
  StudentLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 40.0),
      child: Center(
          child: Text(
        "Login as Student",
        style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 106, 91, 226),
            fontWeight: FontWeight.w500),
      )),
    );
  }
}

class UsernameForm extends StatelessWidget {
  UsernameForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, left: 28.0, right: 28.0),
      child: TextField(
        // keyboardType: TextInputType.emailAddress,
        cursorColor: Color.fromARGB(255, 106, 91, 226),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Color.fromARGB(255, 106, 91, 226),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Username",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 106, 91, 226),
              fontSize: 14,
              fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 106, 91, 226), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 106, 91, 226), width: 2.0),
          ),
        ),
      ),
    );
  }
}

class IdForm extends StatelessWidget {
  IdForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, left: 28.0, right: 28.0),
      child: TextField(
        cursorColor: Color.fromARGB(255, 106, 91, 226),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.pin,
            color: Color.fromARGB(255, 106, 91, 226),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Quiz ID",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 106, 91, 226),
              fontSize: 14,
              fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 106, 91, 226), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 106, 91, 226), width: 2.0),
          ),
        ),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  StartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 145.0, vertical: 50.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => QuizScreen())));
        },
        child: Text(
          "Start Quiz",
          style: TextStyle(fontSize: 16),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 106, 91, 226)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              side: BorderSide(
                color: Color.fromARGB(255, 106, 91, 226),
              ))),
        ),
      ),
    );
  }
}
