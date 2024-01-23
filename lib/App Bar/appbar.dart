import 'package:flutter/material.dart';
import 'package:personal_website/Utils/colors.dart';
import 'package:personal_website/Utils/icons.dart';

AppBar appBar(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return AppBar(
    shadowColor: transparent, 
    elevation: 0,
    backgroundColor: transparent,
    forceMaterialTransparency:true,
    leading: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "UMD",
        style:
        TextStyle(
          color: Colors.black, 
          fontWeight: FontWeight.bold,
          fontSize: 25,
          ),),
    ),
    leadingWidth: size.width/8,
    actions:  [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(color: Colors.black,onPressed: (){

      },icon: drawerIcon),
    )
  ]);
}
