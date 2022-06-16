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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CancelButton(),
                Timer(),
                QuizNumber(),
              ],
            ),
            const Question(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Phnom Penh",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 106, 91, 226)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            side: BorderSide(
                              color: Color.fromARGB(255, 106, 91, 226),
                            ))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Kompong Cham",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 106, 91, 226)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            side: BorderSide(
                              color: Color.fromARGB(255, 106, 91, 226),
                            ))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Siem Reap",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 106, 91, 226)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            side: BorderSide(
                              color: Color.fromARGB(255, 106, 91, 226),
                            ))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sihanoukville",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 106, 91, 226)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            side: BorderSide(
                              color: Color.fromARGB(255, 106, 91, 226),
                            ))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question extends StatelessWidget {
  const Question({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 95.0, horizontal: 15.0),
      child: SizedBox(
        height: 100,
        child: Text(
          "In which city of Cambodia is the largest part?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class QuizNumber extends StatelessWidget {
  const QuizNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 13.5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(width: 1, color: Colors.white)),
      child: const Text(
        "#  10",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }
}

class Timer extends StatelessWidget {
  const Timer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "10 : 45",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pop();
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 1,
                color: Colors.white,
              )),
          child: const Icon(
            Icons.close_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
