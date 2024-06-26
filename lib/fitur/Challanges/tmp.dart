import 'package:flutter/material.dart';
import 'package:learning_app/fitur/Challanges/myDictionary/dictionary.dart';
import 'Sentences/HandlerButton.dart';
// import './myDictionary/dictionary.dart';
import 'package:learning_app/fitur/Challanges/TranslateGames/button_translate.dart';

class Challange extends StatefulWidget {
  const Challange({Key? key}) : super(key: key);

  @override
  State<Challange> createState() => _ChallangeState();
}

class _ChallangeState extends State<Challange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Challange",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 200, // Mengatur tinggi card
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://imagedelivery.net/M-WJkhhMQR3UnTiHqMrwAA/ef9fbecf-0309-4936-7f1c-1a809038ba00/public"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.text_fields, color: Colors.white),
                      title: Text(
                        "Word Display",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    ButtonBar(
                      children: [
                        TextButton(
                          child: const Text('Open',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HandlerButton(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 200, // Mengatur tinggi card
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://www.theme-junkie.com/wp-content/uploads/Gaming-font-6.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.translate, color: Colors.white),
                      title: Text(
                        "Button Translate",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    ButtonBar(
                      children: [
                        TextButton(
                          child: const Text('Open',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ButtonTranslate(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 200, // Mengatur tinggi card
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://t4.ftcdn.net/jpg/01/29/14/65/360_F_129146509_I99Ijq6C9Z27ZdQq7aMJ8qJuj7oMFlIN.jpg?text=Vocabulary"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.lightbulb, color: Colors.white),
                      title: Text(
                        "Halaman Challange",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    ButtonBar(
                      children: [
                        TextButton(
                          child: const Text('Open',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WordListScreen()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
