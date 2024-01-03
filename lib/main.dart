import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/firebase_options.dart';
import 'package:personal_website/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MaterialApp(home: Homepage(),color: Colors.black12,debugShowCheckedModeBanner: false,));
}
