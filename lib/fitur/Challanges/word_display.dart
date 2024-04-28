import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'word_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Word Display App'),
        ),
        body: WordDisplay(),
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
  late List<bool> isButtonDisabled;
  List<String> submittedWords = [];
  int currentWordIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  void _loadWords() async {
    Map<String, dynamic> data = await WordProvider.fetchWords();
    List<dynamic> wordsData = data['data'];

    setState(() {
      bahasaIndo = wordsData[currentWordIndex]['bahasa_indo'].toString();
      bahasaInggris = wordsData[currentWordIndex]['bahasa_inggris'].toString();
      displayedWords =
          List<Map<String, dynamic>>.from(wordsData[currentWordIndex]['kata']);
      isButtonDisabled = List.generate(displayedWords.length, (_) => false);
      submittedWords.clear();
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
      _loadNextWords();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Jawaban Anda salah!'),
        backgroundColor: Colors.red,
      ));
      setState(() {
        submittedWords.clear();
        isButtonDisabled = List.generate(displayedWords.length, (_) => false);
      });
    }
  }

  void _toggleSelection(int index) {
    setState(() {
      isButtonDisabled[index] = !isButtonDisabled[index];
      if (isButtonDisabled[index]) {
        submittedWords.add(displayedWords[index]['eng']);
      } else {
        submittedWords.remove(displayedWords[index]['eng']);
      }
    });
  }

  void _loadNextWords() async {
    Map<String, dynamic> data = await WordProvider.fetchWords();
    List<dynamic> wordsData = data['data'];

    setState(() {
      currentWordIndex++;
      if (currentWordIndex < wordsData.length) {
        bahasaIndo = wordsData[currentWordIndex]['bahasa_indo'].toString();
        bahasaInggris =
            wordsData[currentWordIndex]['bahasa_inggris'].toString();
        displayedWords = List<Map<String, dynamic>>.from(
            wordsData[currentWordIndex]['kata']);
        isButtonDisabled = List.generate(displayedWords.length, (_) => false);
        submittedWords.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Anda telah menyelesaikan semua kata!'),
          backgroundColor: Colors.green,
        ));
        _loadWords();
      }
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
            children: displayedWords.isNotEmpty
                ? List.generate(displayedWords.length, (index) {
                    return ElevatedButton(
                      onPressed: () {
                        _toggleSelection(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isButtonDisabled[index] ? Colors.grey : Colors.blue,
                      ),
                      child: Text(
                        displayedWords[index]['eng'],
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  })
                : [],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _checkTranslation,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
