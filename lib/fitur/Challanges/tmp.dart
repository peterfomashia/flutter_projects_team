import 'package:flutter/material.dart';
import 'package:learning_app/fitur/Challanges/myDictionary/dictionary.dart';
import 'Sentences/HandlerButton.dart';
import 'package:learning_app/fitur/Challanges/TranslateGames/button_translate.dart';

class Challange extends StatefulWidget {
  const Challange({Key? key}) : super(key: key);

  @override
  State<Challange> createState() => _ChallangeState();
}

class _ChallangeState extends State<Challange> {
  bool _loading = false;

  Future<void> _navigateToHandlerButton(BuildContext context) async {
    setState(() {
      _loading = true;
    });

    await Future.delayed(Duration(milliseconds: 500)); // Simulating a delay

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HandlerButton(),
      ),
    );

    setState(() {
      _loading = false;
    });
  }

  Future<void> _navigateToButtonTranslate(BuildContext context) async {
    setState(() {
      _loading = true;
    });

    await Future.delayed(Duration(milliseconds: 500)); // Simulating a delay

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ButtonTranslate(),
      ),
    );

    setState(() {
      _loading = false;
    });
  }

  Future<void> _navigateToWordListScreen(BuildContext context) async {
    setState(() {
      _loading = true;
    });

    await Future.delayed(Duration(milliseconds: 500)); // Simulating a delay

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WordListScreen(),
      ),
    );

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                _buildCard(
                  "Word Display",
                  "https://imagedelivery.net/M-WJkhhMQR3UnTiHqMrwAA/ef9fbecf-0309-4936-7f1c-1a809038ba00/public",
                  Icons.text_fields,
                  _navigateToHandlerButton,
                ),
                const SizedBox(height: 10),
                _buildCard(
                  "Button Translate",
                  "https://www.theme-junkie.com/wp-content/uploads/Gaming-font-6.jpeg",
                  Icons.translate,
                  _navigateToButtonTranslate,
                ),
                const SizedBox(height: 10),
                _buildCard(
                  "Halaman Challange",
                  "https://t4.ftcdn.net/jpg/01/29/14/65/360_F_129146509_I99Ijq6C9Z27ZdQq7aMJ8qJuj7oMFlIN.jpg?text=Vocabulary",
                  Icons.lightbulb,
                  _navigateToWordListScreen,
                ),
              ],
            ),
          ),
        ),
        if (_loading)
          LoadingScreen(),
      ],
    );
  }

  Widget _buildCard(String title, String imageUrl, IconData icon, Function(BuildContext) onPressed) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: Colors.white),
              title: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text(
                    'Open',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      _loading = true;
                    });

                    Future.delayed(Duration(milliseconds: 500), () {
                      onPressed(context);
                      setState(() {
                        _loading = false;
                      });
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
