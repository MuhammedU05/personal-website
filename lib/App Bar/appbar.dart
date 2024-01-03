import 'package:flutter/material.dart';
import 'package:personal_website/Utils/colors.dart';
import 'package:personal_website/Utils/icons.dart';

AppBar appBar() {
  return AppBar(
    shadowColor: transparent, 
    elevation: 0,
    backgroundColor: transparent,
    // leading: Text("Muhammed U"),
    actions:  [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(color: white,onPressed: (){},icon: drawerIcon),
    )
  ]);
}
