import 'package:flutter/material.dart';
import 'word_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Word Display App'),
        ),
        body: const WordDisplay(),
      ),
    );
  }
}

class WordDisplay extends StatefulWidget {
  const WordDisplay({Key? key}) : super(key: key);

  @override
  _WordDisplayState createState() => _WordDisplayState();
}

class _WordDisplayState extends State<WordDisplay> {
  late String bahasaIndo = '';
  late String bahasaInggris = '';
  late List<Map<String, dynamic>> displayedWords = [];
  late List<String> selectedWords;
  late List<bool> isButtonDisabled;
  List<String> submittedWords = [];

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  void _loadWords() async {
    Map<String, dynamic> data = await WordProvider.fetchWords();
    List<dynamic> words = data['kata'];

    setState(() {
      bahasaIndo = data['bahasa_indo'].toString();
      bahasaInggris = data['bahasa_inggris'].toString();
      displayedWords = List<Map<String, dynamic>>.from(words);
      selectedWords = List.filled(displayedWords.length, '');
      isButtonDisabled = List.generate(displayedWords.length, (_) => false);
    });
  }

  void _checkTranslation() {
    if (submittedWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Anda belum memilih kata!'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    String userAnswer = submittedWords.join(' ');

    if (userAnswer == bahasaInggris) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Jawaban Anda benar!'),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Jawaban Anda salah!'),
        backgroundColor: Colors.red,
      ));
    }
  }

  void _toggleSelection(int index) {
    setState(() {
      final word = displayedWords[index]['eng'];
      if (submittedWords.contains(word)) {
        submittedWords.remove(word);
      } else {
        submittedWords.add(word!);
      }
      isButtonDisabled[index] = !isButtonDisabled[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Display'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Susun kata ini ke dalam bahasa Inggris:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            bahasaIndo,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(displayedWords.length, (index) {
              return ElevatedButton(
                onPressed: isButtonDisabled[index]
                    ? null
                    : () {
                        _toggleSelection(index);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isButtonDisabled[index] ? Colors.grey : Colors.blue,
                ),
                child: Text(
                  displayedWords[index]['eng'] ?? '',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _checkTranslation,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: Text('Submit'),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
