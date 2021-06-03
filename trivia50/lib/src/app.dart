import 'package:flutter/material.dart';
import '../src/screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trivia50',
      theme: ThemeData(
        accentColor: Colors.deepPurple,
        primaryColor: Color(0xFFe09f42),
        secondaryHeaderColor: Colors.deepOrange,
      ),
      home: LoginPage(),
    );
  }
}
