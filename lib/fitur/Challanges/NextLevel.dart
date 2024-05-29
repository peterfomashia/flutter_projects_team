import 'package:flutter/material.dart';

class NextLevel extends StatelessWidget {
  const NextLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ini Level Dua ya Geng.."),
      ),
      body: Text(
          "Ini Halaman Pencocokan Kata menjadi kalimat yang dibuat Albert..."),
    );
  }
}
