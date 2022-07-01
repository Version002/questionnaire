import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Future<dynamic> fetchDocuments() async {
    var collection =
        FirebaseFirestore.instance.collection('teacher').snapshots();
    print(collection);
  }

  @override
  void initState() {
    fetchDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.all(50.0),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('teacher').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  print(snapshot.data!.docs[index]);
                  DocumentSnapshot doc = snapshot.data!.docs[1];
                  String name = doc['name'];
                  // String quizName = doc['quiz.quiz_name'];
                  // List questions = List.castFrom(doc["quiz_questions"]);
                  return ListTile(
                    title: Text(name),
                  );
                });
          }),
    )));
  }
}
