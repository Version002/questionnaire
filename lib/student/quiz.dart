import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 106, 91, 226),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: const [
                Icon(Icons.close_rounded),
                Text(
                  "10 : 45",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "# 10",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 12.0),
              child: SizedBox(
                height: 100,
                child: Text(
                  "In which city of Cambodia is the largest part?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Phnom Penh",
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 106, 91, 226)),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    side: BorderSide(
                      color: Color.fromARGB(255, 106, 91, 226),
                    ))),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Kompong Cham",
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 106, 91, 226)),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    side: BorderSide(
                      color: Color.fromARGB(255, 106, 91, 226),
                    ))),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Siem Reap",
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 106, 91, 226)),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    side: BorderSide(
                      color: Color.fromARGB(255, 106, 91, 226),
                    ))),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Sihanoukville",
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 106, 91, 226)),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    side: BorderSide(
                      color: Color.fromARGB(255, 106, 91, 226),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
