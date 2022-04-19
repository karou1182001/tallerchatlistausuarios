import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

import 'ui/my_app.dart';

Future<void> main() async {
  // this is the key
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Configuration {
  static const apiKey = "";
  static const authDomain = "";
  static const databaseURL = "";
  static const projectId = "";
  static const storageBucket = "";
  static const messagingSenderId = "";
  static const appId = "";
  static const measurementId = "";
}
