import 'package:flutter/material.dart';
import 'package:login_app/screens/login_screen.dart';
import 'package:login_app/screens/register_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.purple,
    ),
    title: "Login App",
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
    },
  ));
}
