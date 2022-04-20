import 'dart:async';
import 'dart:convert';

import 'package:f_chat_template/ui/controllers/authentication_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class ChatController extends GetxController {
  RxList<User> users = <User>[].obs;

  final databaseRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  void writeData(String email, String uid) {
    databaseRef
        .child('Usuario')
        .child(uid + '1')
        .set({'email': email, 'uid': uid});
  }

  // void readData() {
  //   databaseRef.child('Usuario').get().then((DataSnapshot snapshot) {
  //     print('Data : ${snapshot.value}');

  //   });
  // }
  void readData() {
    databaseRef.child('Usuario').get().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
}
