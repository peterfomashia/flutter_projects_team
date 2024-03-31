import 'package:flutter/material.dart';
import 'package:learning_app/login_and_regist/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning_App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
      },
    );
  }
}
