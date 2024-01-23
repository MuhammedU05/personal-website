import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../homepage.dart';

Widget body(BuildContext context, List<Scribble> scribbles) {
  var size = MediaQuery.of(context).size;
  bool isMobileView = true;
  size.width < 600 ? isMobileView = false : true;
  return ScrollConfiguration(
    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
    child: ScrollTransformView(children: [
      ScrollTransformItem(builder: (scrollOffset) {
        return Container(
          height: size.height * .07,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("UMD",
                    //!"$isMobileView",
                    //?"${size.width}",
                    style: GoogleFonts.stoke(
                      textStyle: const TextStyle(
                        letterSpacing: 1.2,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        // color: Color(0xFF4C4C4C),
                      ),
                    )),
              ),
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black87, //Color(0xFF4C4C4
                  // C)),
                  size: 40,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              )
            ],
          ),
        );
      }),
      // Container(
      //   height: size.height / 1.5,
      //   width: double.maxFinite,
      //   color: Colors.grey,
      //   child: Stack(children: [
      //     isMobileView
      //         ? Image.asset(
      //             "IMG.PNG",
      //             fit: BoxFit.cover,
      //             // ),
      //             // ),
      //           )
      //         : Padding(
      //             padding: EdgeInsets.only(left: size.width / 3),
      //             child: Flexible(
      //               flex: 1,
      //               child: Image.asset(
      //                 "IMG.PNG",
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //   ]),
      // ),
      ScrollTransformItem(
        builder: (scrollOffset) {
          final offScreenPercentage = min(scrollOffset / size.height, 1.0);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Static scribbles background
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'bg.PNG',
                    fit: BoxFit.contain,
                    width: double.maxFinite,
                    height: size.height / 1.5,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        'pic.PNG',
                        fit: BoxFit.contain,
                        width: size.width - (size.width * 0.25 * offScreenPercentage),
                        height: size.height - (size.height * 0.25 * offScreenPercentage),
                        // height: size.height / 1.5,
                      ),
                      
                    ],
                  ),
                  Text("MUHAMMED U",
                          style: GoogleFonts.wallpoet(
                            textStyle: const TextStyle(
                              // height: 20,
                              color: Colors.white,
                              letterSpacing: 1.2,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              // color: Color(0xFF4C4C4C),
                            ),
                          ))
                  // Image
                ],
              ),
              //     // Animated scribbles
              // Stack(
              //   children: scribbles
              //       .map((scribble) => Positioned(
              //             left: scribble.position.dx,
              //             top: scribble.position.dy,
              //             child: Image.asset(
              //               'bg.PNG',
              //               width: 20,
              //               height: 20,
              //             ),
              //           ))
              //       .toList(),
              // ),
            ],
          );
        },
        offsetBuilder: ((scrollOffset) {
          return Offset(0, scrollOffset * 0.7);
        }),
      ),
      ScrollTransformItem(builder: (scrollOffset) {
        return Container(
            height: size.height / 1.5,
            width: double.maxFinite,
            color: Colors.black,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: size.width / 7,
                      ),
                      Card1(
                        yaxis: 3,
                        image:
                            'https://static.vecteezy.com/system/resources/thumbnails/000/600/537/small/BG58-01.jpg',
                        text: 'GitHub',
                      ),
                    ],
                  );
                })
            // ListView(
            // controller: _pageController,
            // allowImplicitScrolling: true,
            // scrollDirection: Axis.horizontal,
            // children:[
            // Card(
            //   color: Colors.white,
            //   margin: const EdgeInsets.all(20),
            //   elevation: 8,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(16),

            //   )
            // ),
            // Card(
            //   margin: const EdgeInsets.all(20),
            //   elevation: 8,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(16),

            //   )
            // ),
            // Card(
            //   margin: const EdgeInsets.all(20),
            //   elevation: 8,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(16),

            //   )
            // ),
            // Card(
            //   margin: const EdgeInsets.all(20),
            //   elevation: 8,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(16),

            //   )
            // ),
            //   ]
            // )
            );
      }),
      ScrollTransformItem(builder: (scrollOffset) {
        return Container(
          height: size.height / 2,
          width: double.maxFinite,
          color: Colors.grey,
        );
      }),
      ScrollTransformItem(builder: (scrollOffset) {
        return Container(
          height: size.height / 2,
          width: double.maxFinite,
          color: Colors.black,
        );
      }),
    ]),
  );
}

class Card1 extends StatefulWidget {
  final double yaxis;
  final String image;
  final String text;
  // final String subText;

  const Card1(
      {super.key,
      required this.yaxis,
      required this.image,
      required this.text});

  @override
  _Card1State createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  double x = 0.0;
  double y = 0.0;
  double borderValueY = 150.0;
  double borderValueX = 200.0;
  double beginY = 0.0;
  double endY = 0.0;
  double beginX = 0.0;
  double endX = 0.0;
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      tween: Tween(
        begin: beginX,
        end: endX,
      ),
      builder: (context, valueX, child) => TweenAnimationBuilder(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
        tween: Tween(
          begin: beginY,
          end: endY,
        ),
        builder: (context, valueY, child) {
          return Stack(
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(valueX)
                  // ..rotateX(-valueX)
                  // ..rotateY(-valueY)
                  ..rotateY(valueY),
                alignment: FractionalOffset.center,
                child: MouseRegion(
                  onHover: (details) {
                    double yvalue = widget.yaxis - details.localPosition.dx;
                    double xvalue =
                        (size.height / 3) - details.localPosition.dy;
                    print(xvalue);
                    if (yvalue <= borderValueY && yvalue >= -borderValueY) {
                      setState(() {
                        double oldRange = (borderValueY - (-borderValueY));
                        double newRange = (0.35 - (-0.35));
                        double newValue =
                            (((yvalue - (-borderValueY)) * newRange) /
                                    oldRange) +
                                (-0.35);
                        beginY = y;
                        y = newValue;
                        endY = y;
                        oldRange = (borderValueX - (-borderValueX));
                        newRange = (0.35 - (-0.35));
                        newValue = (((-xvalue - (-borderValueX)) * newRange) /
                                oldRange) +
                            (-0.35);
                        beginX = x;
                        x = newValue;
                        endX = x;
                      });
                    }
                  }, //?
                  onExit: (event) {
                    print('exited');
                    setState(() {
                      y = 0.0;
                      x = 0.0;
                      beginY = 0.0;
                      endY = 0.0;
                      beginX = 0.0;
                      endX = 0.0;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 300.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("BG_Card.jpg"),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: size.height / 20,
                        left: size.width / 15,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(0.0, 0.0, -20.0),
                          alignment: FractionalOffset.center,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.text,
                                style: TextStyle(
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.w700,
                                  color: textColor,
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.location_on,
                              //       color: textColor,
                              //       size: 13.0,
                              //     ),
                              //     const SizedBox(
                              //       width: 3.0,
                              //     ),
                              //     Text(
                              //       widget.subText,
                              //       style: TextStyle(
                              //         fontSize: 13.0,
                              //         fontWeight: FontWeight.w300,
                              //         color: textColor,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
