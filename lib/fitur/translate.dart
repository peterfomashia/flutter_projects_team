import 'package:flutter/material.dart';
import 'package:learning_app/fitur/profile/profile.dart';
import 'package:learning_app/fitur/translate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Home.dart';
import 'challange.dart';

class Translate extends StatefulWidget {
  const Translate({super.key});

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teranslate", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Halaman Transalate",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ))
        ],
      ),
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: Colors.blue,
        color: Colors.white,
        activeColor: Colors.greenAccent,
        padding: EdgeInsets.all(20),
        onTabChange: (index) {
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
          } else if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Translate()));
          } else if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Challange()));
          } else if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
          }
        },
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.book,
            text: 'Translate',
          ),
          GButton(
            icon: Icons.games,
            text: 'Challenge',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],),
    );
  }
}
