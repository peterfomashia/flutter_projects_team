import 'package:flutter/material.dart';
import 'package:learning_app/Home.dart';
import 'package:learning_app/fitur/profile/provider/profil_prov.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fitur/profile/provider/switchProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await _getLoginStatus();
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    key: null,
  ));
}

Future<bool> _getLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({required key, required this.isLoggedIn}) : super(key: key);
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
          home: const Home(),
        );
      }),
    );
  }
}
