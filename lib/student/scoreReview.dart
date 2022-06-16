import 'package:flutter/material.dart';

class ScoreReview extends StatelessWidget {
  const ScoreReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
              child: Row(
                children: [
                  ScoreReviewText(),
                  CloseButton(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.262,
                decoration: BoxDecoration(
                  color: Color(0xFF6A5BE2),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(width: 1, color: Color(0xFF6A5BE2)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "QUIZ NAME",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Computer Science Quiz",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 115,
                        decoration: BoxDecoration(
                          color: Color(0xffFF8FA3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0)),
                          border:
                              Border.all(width: 1, color: Color(0xffFF8FA3)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "20",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28),
                                  ),
                                  Text(
                                    "/50",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Positioned(
                                    child: Image.asset(
                                      'assets/trophy.png',
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "You got 20",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          "out of 50",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.4274,
              decoration: BoxDecoration(
                color: Color(0xffEEEEFC),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(width: 1, color: Color(0xffEEEEFC)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(
                      "You have done the quiz",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "3 times",
                        style: TextStyle(
                          color: Color(0xFF6A5BE2),
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Color(0xFF6A5BE2),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              "10: 45",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 29,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            "Remaining Time",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Retake",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 106, 91, 226)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
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

class CloseButton extends StatelessWidget {
  const CloseButton({
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
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 1,
                color: Colors.black,
              )),
          child: const Icon(
            Icons.close_rounded,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }
}

class ScoreReviewText extends StatelessWidget {
  const ScoreReviewText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Text(
        "Score Review",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 23,
        ),
      ),
    );
  }
}
