import 'package:flutter/material.dart';
import 'package:learning_app/Home.dart';
import 'package:learning_app/login_and_regist/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning_App',
      home: Home(),
    );
  }
}
