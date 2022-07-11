import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire/signup.dart';
import 'package:questionnaire/studentSignin.dart';

// import 'main.dart';
import 'main.dart';
import 'style/app_color.dart';

final passwordController = TextEditingController();
final userController = TextEditingController();

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
                child: CircularProgressIndicator(),
              ));
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: userController.text.trim(),
            password: passwordController.text.trim());
        print(userController.text.trim());
        print(passwordController.text.trim());
      } on FirebaseAuthException catch (e) {
        // print(e);
        final snackBar = SnackBar(
          content: Text(e.message!),
          backgroundColor: cPrimary,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Logo(),
                    Signin(),
                    UsernameForm(),
                    PasswordForm(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 145.0, vertical: 15.0),
                      child: TextButton(
                        onPressed: signIn,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 106, 91, 226)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 106, 91, 226),
                                  ))),
                        ),
                      ),
                    ),
                    // LoginButton(),
                    Or(),
                    StudentLoginButton(),
                    SignUpText()
                  ],
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class StudentLoginButton extends StatelessWidget {
  const StudentLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 105.0, vertical: 15.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => StudentSignin())));
        },
        child: Text(
          "Login as a Student",
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

class Or extends StatelessWidget {
  const Or({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
          child: Text(
        'Or',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      )),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Image.asset(
        'assets/quiz.png',
        height: 130,
        width: 130,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class PurpleContainer extends StatelessWidget {
  const PurpleContainer({
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

class SignUpText extends StatelessWidget {
  const SignUpText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account ? ",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color.fromARGB(255, 106, 91, 226)),
            ),
          )
        ],
      ),
    );
  }
}

// class LoginButton extends StatelessWidget {
//   LoginButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 145.0, vertical: 15.0),
//       child: TextButton(
//         onPressed: signIn,
//         child: Text(
//           "Login",
//           style: TextStyle(fontSize: 16),
//         ),
//         style: ButtonStyle(
//           backgroundColor:
//               MaterialStateProperty.all(Color.fromARGB(255, 106, 91, 226)),
//           foregroundColor: MaterialStateProperty.all(Colors.white),
//           shape: MaterialStateProperty.all(RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(5.0)),
//               side: BorderSide(
//                 color: Color.fromARGB(255, 106, 91, 226),
//               ))),
//         ),
//       ),
//     );
//   }

// Future signIn() async {
//   try {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: userController.text.trim(),
//         password: passwordController.text.trim());
//   } on FirebaseAuthException catch (e) {
//     print(e);
//     final snackBar = SnackBar(
//         content: Text(e.message!),
//         backgroundColor: cPrimary,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
// }

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 24.0, left: 26.0, right: 26.0, bottom: 50.0),
      child: TextField(
        controller: passwordController,
        cursorColor: Color.fromARGB(255, 106, 91, 226),
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.password,
            color: Color.fromARGB(255, 106, 91, 226),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Password",
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

class UsernameForm extends StatelessWidget {
  const UsernameForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, left: 28.0, right: 28.0),
      child: TextField(
        controller: userController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Color.fromARGB(255, 106, 91, 226),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Color.fromARGB(255, 106, 91, 226),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Email",
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

class Signin extends StatelessWidget {
  const Signin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 40.0),
      child: Center(
          child: Text(
        "Sign In",
        style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 106, 91, 226),
            fontWeight: FontWeight.w500),
      )),
    );
  }
}
