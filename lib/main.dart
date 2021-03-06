import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:questionnaire/signin.dart';
import 'package:questionnaire/verifyemail.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
//     SystemUiOverlay.bottom, //This line is used for showing the bottom bar
//   ]);

//   runApp(const MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // scaffoldMessengerKey:  Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return VerifyEmailPage();
        } else {
          return SignIn();
        }
      },
    );
  }
}

MaterialColor? primaryColor = const MaterialColor(0xFF6A5BE2, <int, Color>{
  50: Color(0xFF6A5BE2),
  100: Color(0xFF6A5BE2),
  200: Color(0xFF6A5BE2),
  300: Color(0xFF6A5BE2),
  400: Color(0xFF6A5BE2),
  500: Color(0xFF6A5BE2),
  600: Color(0xFF6A5BE2),
  700: Color(0xFF6A5BE2),
  800: Color(0xFF6A5BE2),
  900: Color(0xFF6A5BE2),
});
