import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() => runApp(MovieApp());

class MovieApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
