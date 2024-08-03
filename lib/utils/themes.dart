import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      cardColor: lightGrayColor,
      canvasColor: Colors.white,
      primaryColor: Colors.black,
      accentColor: Colors.black,
      buttonColor: Colors.deepPurple,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          centerTitle: true));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      cardColor: darkGrayColor,
      canvasColor: Colors.black,
      buttonColor: darkBluishColor,
      accentColor: Colors.white,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          centerTitle: true));

  static Color darkGrayColor = Vx.gray900;
  static Color lightGrayColor = Vx.gray200;
  static Color darkBluishColor = Colors.lightBlue.shade900;
  static Color lightBluishColor = Vx.blue100;
}
