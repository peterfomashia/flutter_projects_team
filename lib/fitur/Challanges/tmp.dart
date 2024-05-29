import 'package:flutter/material.dart';
import 'package:learning_app/fitur/Challanges/button_translate.dart';
import 'package:learning_app/fitur/Challanges/word_display.dart';

//Tempat untuk menampung beberapa class challanges

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
        title: const Text("Challange", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>  WordDisplay(),
                  ),
                  );
                },
                child: const Text(
                  "Word Display",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ButtonTranslate(),
                    ),
                  );
                },
                child: const Text(
                  "Halaman Challange",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Halaman Challange",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
