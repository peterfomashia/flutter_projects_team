import 'package:flutter/material.dart';
import 'package:learning_app/Home.dart';
import 'package:learning_app/fitur/profile/provider/profil_prov.dart';
import 'package:learning_app/fitur/translate.dart';
import 'package:provider/provider.dart';

import 'fitur/profile/provider/switchProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfilProv()),
        ChangeNotifierProvider(create: (_) => SwitchModeProvider())
      ],
      child: Consumer<SwitchModeProvider>(builder: (context, value, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: value.themeData,
        title: 'Learning_App',
        home: TranslationChatPage(),
      );
    }),
    );
  }
}
