import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: blooddonation(),
    debugShowCheckedModeBanner: false,
  ));
}
