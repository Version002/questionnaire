import 'package:cloud_firestore/cloud_firestore.dart';

class teacherService {
  Future retriving() async {
    var collection = FirebaseFirestore.instance.collection('teacher');
    var docSnapshot = await collection.doc('ETX2Cdra8r4he1ElSrwC').get();
    if (docSnapshot.exists){
       Map<String, dynamic>? teacherData = docSnapshot.data();
    }
  }
}
