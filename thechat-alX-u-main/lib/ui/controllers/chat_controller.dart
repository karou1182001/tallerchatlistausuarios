import 'dart:async';

import 'package:f_chat_template/ui/controllers/authentication_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class ChatController extends GetxController {
  final databaseRef = FirebaseDatabase.instance.ref();

  void writeData(String email, String uid) {
    databaseRef
        .child('Usuario')
        .child(uid + '1')
        .set({'email': email, 'uid': uid});
  }
}
