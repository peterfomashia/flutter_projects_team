import 'package:flutter/material.dart';



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
        title: const Text("Same Word", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Halaman Challange",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ))
        ],
      ),

    );
  }
}
