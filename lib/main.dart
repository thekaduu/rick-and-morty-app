import 'package:flutter/material.dart';
import 'package:ricknmorty/home/screens/home_screen.dart';
import 'package:ricknmorty/styles/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SegoeUI',
      ),
      home: const HomeScreen(),
    );
  }
}
