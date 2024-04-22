import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learning_app/fitur/profile.dart';
import 'package:learning_app/fitur/translate.dart';

import '../Home.dart';

class Challange extends StatefulWidget {
  const Challange({super.key});

  @override
  State<Challange> createState() => _ChallangeState();
}

class _ChallangeState extends State<Challange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Same Word", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Halaman Challange",
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
