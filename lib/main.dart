import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/myStore.dart';
import 'package:flutter_application_1/pages/cart.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      // themeMode: ThemeMode.dark,
      darkTheme: MyTheme.darkTheme(context),
      theme: MyTheme.lightTheme(context),
      //ThemeData(primarySwatch: Colors.green, brightness: Brightness.dark),
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cart: (context) => Cart(),
      },
    );
  }
}
