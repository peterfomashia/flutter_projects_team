import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:learning_app/fitur/profile/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 1; // Ganti nilai default menjadi 1 untuk menampilkan halaman Profile saat aplikasi pertama kali dijalankan

  Widget bodyPage(int index){
    switch(index){
      case 0:
        return Center(child: Text('Home Page'));
      case 1:
        return Profile();
      default:
        return Container(); // You can return any default widget here
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: selected == 0 ? AppBar( // Hanya menampilkan AppBar jika sedang berada di halaman Home
          title: Text("Halaman Home!", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
        ) : null,
      floatingActionButton: SpeedDial(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        child: Icon(Icons.gas_meter_sharp),
        childMargin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          SpeedDialChild(
              label: "Edit",
              child: Icon(Icons.edit),
              shape: CircleBorder()
          ),
          SpeedDialChild(
              label: "Copy",
              child: Icon(Icons.copy),
              shape: CircleBorder()
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: bodyPage(selected),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Color(0xff202020),
        activeIndex: selected,
        icons: [
          Icons.home,
          Icons.account_circle,
        ],
        gapLocation: GapLocation.center,
        activeColor: Colors.blue,
        inactiveColor: Colors.white,
        onTap: (int index){
          setState(() {
            selected = index;
          });
        },
      ),
    );
  }
}
