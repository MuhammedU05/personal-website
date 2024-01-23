import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_website/Body/body.dart';

class HomePage extends StatefulWidget {
  // BuildContext context;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  List<Scribble> scribbles = [];
  double speed = Random().nextDouble() * 2 + 1;
  @override
  void initState() {
    super.initState();
    initializeScribbles();
  }

  void initializeScribbles() {
    const numberOfScribbles = 20;

    for (int i = 0; i < numberOfScribbles; i++) {
      scribbles.add(
        Scribble(
          position: Offset(
            Random().nextDouble() * 300 + 50,
            Random().nextDouble() * 400 + 50,
          ),
          // speed: Random().nextDouble() * 2 + 1,
          angle: Random().nextDouble() * 2 * pi,
          image:"scribles/IMG_0240.PNG"
        ),
      );
    }

    startScribbleAnimation();
  }

  void startScribbleAnimation() {
    for (int i = 0; i < scribbles.length; i++) {
      final scribble = scribbles[i];

      // Using a periodic timer to update scribble positions
      Timer.periodic(const Duration(milliseconds: 16), (timer) {
        setState(() {
          scribble.position += Offset(
            speed * cos(scribble.angle),
            speed * sin(scribble.angle),
          );

          // Ensure the scribble stays within screen boundaries
          if (scribble.position.dx < 0 || scribble.position.dx > 400) {
            scribble.angle = pi - scribble.angle;
          }

          if (scribble.position.dy < 0 || scribble.position.dy > 600) {
            scribble.angle = -scribble.angle;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(context),
      body: body(context, scribbles),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      endDrawer: Container(),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}

class Scribble {
  Offset position;
  // double speed = 3;
  double angle;
  String image;

  Scribble(
      {required this.position,
      // required this.speed,
      required this.angle,
      required this.image});
}
