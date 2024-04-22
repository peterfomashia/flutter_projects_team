import 'package:flutter/material.dart';
import 'package:learning_app/fitur/profile.dart';

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
        title: Text("Halaman Home!"),
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Home()));
          } else if (index == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Home()));
          } else {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Profile()));
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), label: "Translate"),
          BottomNavigationBarItem(
              icon: Icon(Icons.games), label: "Challage"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      )
    );
  }
}

