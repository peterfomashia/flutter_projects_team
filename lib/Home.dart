import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:learning_app/fitur/profile/profile.dart';
import 'package:learning_app/fitur/Challanges/tmp.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected =
      2;

  Widget bodyPage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Home Page'));
      case 1:
        return const Profile();
      default:
        return Container(); // You can return any default widget here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selected == 0
          ? AppBar(
              // Hanya menampilkan AppBar jika sedang berada di halaman Home
              title: const Text(
                "Halaman Home!",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            )
          : null,
      floatingActionButton: SpeedDial(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        childMargin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: const Icon(Icons.badge),
        onOpen: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  Challange(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: bodyPage(selected),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: const Color(0xff202020),
        activeIndex: selected,
        icons: const [
          Icons.home,
          Icons.account_circle,
        ],
        gapLocation: GapLocation.center,
        activeColor: Colors.blue,
        inactiveColor: Colors.white,
        onTap: (int index) {
          setState(() {
            selected = index;
          });
        },
      ),
    );
  }
}
