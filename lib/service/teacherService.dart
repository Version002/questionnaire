// ignore_for_file: file_names, camel_case_types, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

class teacherService {
  Future retriving() async {
    var collection = FirebaseFirestore.instance.collection('teacher');
    var docSnapshot = await collection.doc('ETX2Cdra8r4he1ElSrwC').get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? teacherData = docSnapshot.data();
    }
  }
}
