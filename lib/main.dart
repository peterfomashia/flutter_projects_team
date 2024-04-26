import 'package:flutter/material.dart';
import 'package:learning_app/Home.dart';
import 'package:learning_app/fitur/profile/profile.dart';
import 'package:learning_app/fitur/profile/provider/profil_prov.dart';
import 'package:learning_app/login_and_regist/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfilProv())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learning_App',
        home: Profile(),
      ),
    );
  }
}
