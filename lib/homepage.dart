import 'package:flutter/material.dart';
import 'package:personal_website/Body/body.dart';

class HomePage extends StatefulWidget {
  // BuildContext context;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(context),
      body: body(context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      endDrawer: Container(),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}


