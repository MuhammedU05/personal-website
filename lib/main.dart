import 'dart:ui';
import 'package:animated_background/animated_background.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:personal_website/Body/end_drawer.dart';
import 'package:personal_website/firebase_options.dart';
import 'package:personal_website/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //MultiProviders
  runApp( MaterialApp(
    title: "Muhammed U",
    home: const HomePage(),
    color: Colors.black12,
    debugShowCheckedModeBanner: false,
    // scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
    scrollBehavior:NoThumbScrollBehavior(
      
    ),
    themeMode: ThemeMode.light,
  ));
}
class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}