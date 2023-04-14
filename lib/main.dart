import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "|goTo_login": (context) => loginPage(),
        "|goTo_register": (context) => registerPage(),
        "|goTo_home": (context) => homePage(),
      },
      home: loginPage(),
    );
  }
}
