import 'package:flutter/material.dart';
import 'package:learning_app/Home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState  extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 80,
                  ),
                  radius: 60,
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text("Nama :"),
                    SizedBox(height: 20),
                    Text("Email :"),
                    SizedBox(height: 20),
                    Text("No. Telp :"),
                    SizedBox(height: 20),
                    Text("Alamat :"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 80),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: Row(
                children: [
                  Icon(Icons.control_point_rounded, size: 30, color: Colors.blue,),
                  SizedBox.fromSize(size: Size(20, 0)),
                  Text(
                    "Cek Point",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: Row(
                children: [
                  Icon(Icons.settings, size: 30, color: Colors.blue,),
                  SizedBox.fromSize(size: Size(20, 0)),
                  Text(
                    "Setting",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: Row(
                children: [
                  Icon(Icons.help, size: 30, color: Colors.blue,),
                  SizedBox.fromSize(size: Size(20, 0)),
                  Text(
                    "Bantuan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            TextButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
            },
              child: Row(
                children: [
                  Icon(Icons.logout, size: 30, color: Colors.blue,),
                  SizedBox.fromSize(size: Size(20, 0)),
                  Text(
                    "Logout",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

