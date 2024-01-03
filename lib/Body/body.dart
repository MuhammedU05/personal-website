import 'package:flutter/material.dart';
import 'package:personal_website/Utils/colors.dart';
import 'package:personal_website/homepage.dart';

Widget body(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return Container(
    height: size.height,
    width: size.width,
    color: black,
    child:  Column(children: [
      SizedBox(height: size.height/8,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Text(name??'No Name',style: TextStyle(
            color: white,
            fontSize: 32,
          ))),
           Text("About Me",style: TextStyle(
            color: white,
            fontSize: 32,
          )),
          ],
      ),
      const SizedBox(height: 50),
      Text("Welcome to My Website!",
          style: TextStyle(
            color: white,
            fontSize: 32,
          )),
    ]),
  );
}
