// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class Scribble {
//   Offset position;
//   double speed;
//   double angle;

//   Scribble({required this.position, required this.speed, required this.angle});
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   List<Scribble> scribbles = [];

//   @override
//   void initState() {
//     super.initState();
//     initializeScribbles();
//   }

//   void initializeScribbles() {
//     const numberOfScribbles = 20;

//     for (int i = 0; i < numberOfScribbles; i++) {
//       scribbles.add(
//         Scribble(
//           position: Offset(
//             Random().nextDouble() * 300 + 50,
//             Random().nextDouble() * 400 + 50,
//           ),
//           speed: Random().nextDouble() * 2 + 1,
//           angle: Random().nextDouble() * 2 * pi,
//         ),
//       );
//     }

//     startScribbleAnimation();
//   }

//   void startScribbleAnimation() {
//     for (int i = 0; i < scribbles.length; i++) {
//       final scribble = scribbles[i];
//       final controller = AnimationController(
//         vsync: this,
//         duration: Duration(seconds: 1),
//       )..repeat();

//       controller.addListener(() {
//         setState(() {
//           scribble.position += Offset(
//             scribble.speed * cos(scribble.angle),
//             scribble.speed * sin(scribble.angle),
//           );

//           // Ensure the scribble stays within screen boundaries
//           if (scribble.position.dx < 0 || scribble.position.dx > 400) {
//             scribble.angle = pi - scribble.angle;
//           }

//           if (scribble.position.dy < 0 || scribble.position.dy > 600) {
//             scribble.angle = -scribble.angle;
//           }
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Static scribbles background
//           Image.asset(
//             'assets/static_scribbles.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           // Animated scribbleså
//           AnimatedBuilder(
//             animation: ,
//             builder: (context, child) {
//               return Stack(
//                 children: scribbles
//                     .map((scribble) => Transform.translate(
//                           offset: scribble.position,
//                           child: Image.asset(
//                             'assets/individual_scribble.png',
//                             width: 20,
//                             height: 20,
//                           ),
//                         ))
//                     .toList(),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class Scribble {
  Offset position;
  double speed;
  double angle;

  Scribble({required this.position, required this.speed, required this.angle});
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<Scribble> scribbles = [];

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
          speed: Random().nextDouble() * 2 + 1,
          angle: Random().nextDouble() * 2 * pi,
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
            scribble.speed * cos(scribble.angle),
            scribble.speed * sin(scribble.angle),
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
      body: Stack(
        children: [
          // Static scribbles background
          Image.asset(
            'assets/static_scribbles.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Animated scribbles
          Stack(
            children: scribbles
                .map((scribble) => Positioned(
                      left: scribble.position.dx,
                      top: scribble.position.dy,
                      child: Image.asset(
                        'assets/individual_scribble.png',
                        width: 20,
                        height: 20,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
