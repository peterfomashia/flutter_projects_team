import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/fitur/challange.dart';
import 'package:learning_app/fitur/profile/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learning_app/fitur/translate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Home!", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Masih Wacana...",
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
          else{
            Navigator.of(context).push;
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
    );}
  }


