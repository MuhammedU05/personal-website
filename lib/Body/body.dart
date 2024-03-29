import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import '../homepage.dart';

Uri? _url;

Widget body(BuildContext context, List<Scribble> scribbles) {
  downloadFile(url) {
    AnchorElement aE = AnchorElement(href: url);
    aE.download = "Muhammed_U";
    aE.click();
  }

  var size = MediaQuery.of(context).size;
  bool isMobileView = true;
  size.width < 600 ? isMobileView = false : true;
  return ScrollConfiguration(
    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
    child: ScrollTransformView(children: [
      ScrollTransformItem(
        builder: (scrollOffset) {
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
                          overflow: TextOverflow.ellipsis,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          // color: Color(0xFF4C4C4C),
                        ),
                      )),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white, //Color(0xFF4C4C4
                    // C)),
                    size: 40,
                  ),
                  onPressed: () {
                    downloadFile('pdf/cv.pdf');
                  },
                )
              ],
            ),
          );
        },
      ),
      ScrollTransformItem(
        builder: (scrollOffset) {
          final offScreenPercentage = min(scrollOffset / size.height, 1.0);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Static scribbles background
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "images/bg.png",
                    fit: BoxFit.contain,
                    repeat: ImageRepeat.repeat,
                    width: double.maxFinite,
                    height: size.height / 2.7,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        "images/pic.png"
                        ,
                        fit: BoxFit.contain,
                        width: size.width -
                            (size.width * 0.75 * offScreenPercentage),
                        // height: size.height -
                        //     (size.height * 0.25 * offScreenPercentage),
                        // height: size.height / 1.5,
                      ),
                    ],
                  ),
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
      // ScrollTransformItem(builder: ((scrollOffset) {
      //   return Container(
      //     color: Colors.grey.shade300,
      //     height: size.height * 0.2,
      //     width: size.width,
      //     child: Text("fd"),
      //   );
      // })),
      ScrollTransformItem(builder: (scrollOffset) {
        return Container(
          height: size.height / 8,
          width: double.maxFinite,
          color: Colors.black38,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hey I'm",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1.5),
                  ),
                ),
                Text("MUHAMMED U",
                    style: GoogleFonts.wallpoet(
                      textStyle: const TextStyle(
                          // height: 20,
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis
                          // color: Color(0xFF4C4C4C),
                          ),
                    ))
              ]),
        );
      }),
      ScrollTransformItem(builder: (scrollOffset) {
        return Container(
          height: size.height / 3,
          width: double.maxFinite,
          color: Colors.black38,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  """I have been working as a freelance Flutter developer since 2023. Over the years,\n
                  I have participated in various projects,\n
                  including a Todo Application that enables users to add, edit, and delete tasks while also incorporating a group chat function using Flutter and Firebase. \n
                  Additionally, I have worked on a Group Chat Application that bears similarities to popular messaging platforms like Whatsapp. \n
                  These experiences have allowed me to hone my skills in Flutter development and work on diverse and exciting projects.""",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        overflow: TextOverflow.visible,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1.5),
                  ),
                ),
                // ResponsiveTextWidget()
              ]),
        );
      }),
      ScrollTransformItem(builder: (scrollOffset) {
        return Container(
            height: 300,
            width: double.maxFinite,
            color: Colors.black,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  // _url = Uri.parse(skills[index]['url']);
                  return 
                  // Stack(
                    // children: [
                      // Image.asset("images/BG_Card.jpg",fit: BoxFit.fitHeight,width: 300,),
                      Column(
                        children: [
                          SizedBox(
                            width: size.width / 7,
                          ),
                          GestureDetector(
                            onTap: () async {
                              _url = Uri.parse(skills[index]['url']);
                              // _url = Uri.parse("https://flutter.dev/");
                              print('Clicked Card');
                              if (_url != null) {
                                // _launchUrl(_url!);
                                await launchUrl(_url!);
                              }
                            },
                            child: Row(
                              children: [
                                SizedBox(height: size.height / 20,width: size.width / 20,),
                                Card1(
                                  yaxis: 3,
                                  image: skills[index]['image'],
                                  text: skills[index]['name'],
                                ),
                                SizedBox(height: size.height / 40,width: size.width / 40,),
                      
                              ],
                            ),
                          )
                        ],
                      // ),
                    // ],
                  );
                },
                ),
                );
      }),
      ScrollTransformItem(builder: (scrollOffset) {
        return Container(
          height: size.height / 2,
          width: double.maxFinite,
          color: Colors.grey,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(width: size.width / 20,),
                Image.asset("projects/${index + 1}.png"),
              ],
            );
          }),
        );
      }),
      ScrollTransformItem(builder: (scrollOffset) {
        return Container(
          height: size.height / 2,
          width: double.maxFinite,
          color: Colors.black,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Tagging Socials Like Github, Linkin, Instagram, Stackoverflow
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Links",
                        style: GoogleFonts.poppins(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly /*| MainAxisAlignment.end*/,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async =>
                                // _launchUrl(_url!);
                                await launchUrl(Uri.parse(
                                    "https://www.linkedin.com/in/muhammed-u-212ab428a/")),
                            child: Container(
                              height: 100,
                              width: 100,
                              // color: Colors.grey.shade700,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      offset: const Offset(0, 4),
                                      color: Colors.black.withOpacity(.16),
                                    )
                                  ]),
                              child: Image.asset("logos/linkdin_logo.png"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => await launchUrl(
                                Uri.parse("https://github.com/MuhammedU05")),
                            child: Container(
                              height: 100,
                              width: 100,
                              // color: Colors.grey.shade700,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      offset: const Offset(0, 4),
                                      color: Colors.black.withOpacity(.15),
                                    )
                                  ]),
                              child: Image.asset("logos/github-logo.png"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => await launchUrl(Uri.parse(
                                "https://stackoverflow.com/users/22753605/muhammed-u")),
                            child: Container(
                              height: 100,
                              width: 100,
                              // color: Colors.grey.shade700,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      offset: const Offset(0, 4),
                                      color: Colors.black.withOpacity(.16),
                                    )
                                  ]),
                              child: Image.asset("logos/stack-overflow.png"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => await launchUrl(Uri.parse(
                                "https://www.instagram.com/u_a_muhammed?igsh=MWNlMzE2cHQ2bzUydQ%3D%3D&utm_source=qr")),
                            child: Container(
                              height: 100,
                              width: 100,
                              // color: Colors.grey.shade700,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      offset: const Offset(0, 4),
                                      color: Colors.black.withOpacity(.16),
                                    )
                                  ]),
                              child: Image.asset("logos/INsta-Logo.png"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async =>
                                await launchUrl(Uri.parse("https://edapt.me/")),
                            child: Container(
                              height: 100,
                              width: 100,
                              // color: Colors.grey.shade700,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      offset: const Offset(0, 4),
                                      color: Colors.black.withOpacity(.16),
                                    )
                                  ]),
                              child: Image.asset("logos/Edapt.jpeg"),
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Valancheri, Malappuram, Kerala, India",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "uamuhammed05@gmail.com",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "+91 9947868132",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
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
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 300.0,
                        width: 200.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("BG_Card.jpg"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 50,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(0.0, 0.0, -20.0),
                          alignment: FractionalOffset.center,
                          child: Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(widget.image),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: size.height / 20,
                        left: size.width * 0.01,
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

List<Map> skills = [
  {
    "name": "Flutter",
    "image": "logos/Google-flutter-logo.png",
    "url": "https://flutter.dev/",
  },
  {
    "name": "Dart",
    "image": "logos/dart_logo.png",
    "url": "https://dart.dev/",
  },
  {
    "name": "Firebase",
    "image": "logos/Firebase_logo.png",
    "url": "https://firebase.google.com/",
  },
  {
    "name": "Git",
    "image": "logos/Git_Logo.png",
    "url": "https://git-scm.com/",
  },
  {
    "name": "Java",
    "image": "logos/Java_Logo.png",
    "url": "https://www.java.com/en/",
  },
  {"name": "C", "image": "logos/C_Logo.png", "url": ""},
];


class ResponsiveTextWidget extends StatelessWidget {
  const ResponsiveTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth / 20; // Adjust this multiplier as needed

        return Text(
          """I have been working as a freelance Flutter developer since 2023. Over the years,\n
                  I have participated in various projects,\n
                  including a Todo Application that enables users to add, edit, and delete tasks while also incorporating a group chat function using Flutter and Firebase. \n
                  Additionally, I have worked on a Group Chat Application that bears similarities to popular messaging platforms like Whatsapp. \n
                  These experiences have allowed me to hone my skills in Flutter development and work on diverse and exciting projects.""",
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              overflow: TextOverflow.visible,
              fontWeight: FontWeight.w600,
              letterSpacing: -1.5,
            ),
          ),
        );
      },
    );
  }
}
