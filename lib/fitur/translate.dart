import 'package:flutter/material.dart';
class TranslationChatPage extends StatefulWidget {
  @override
  _TranslationChatPageState createState() => _TranslationChatPageState();
}

class _TranslationChatPageState extends State   <TranslationChatPage> {
  final TextEditingController _controller = TextEditingController();
  String _inputText = '';
  String _translatedText = '';

  void _translateText(String text) {
    // Implementasi fungsi terjemahan di sini

    // Misalnya, Anda dapat menggunakan API terjemahan seperti Google Translate
    // atau library pihak ketiga seperti Microsoft Translator API.
    // Di sini, kita akan menggunakan contoh sederhana dengan hanya membalik kata.
    setState(() {
      _translatedText = _reverseWords(text);
    });
  }

  String _reverseWords(String text) {
    List<String> words = text.split(' ');
    List<String> reversedWords = words.map((word) => word.split('').reversed.join()).toList();
    return reversedWords.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Terjemahan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildChatBubble(_inputText, isUser: true),
                _buildChatBubble(_translatedText, isUser: false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: (text) {
                      setState(() {
                        _inputText = text;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _translateText(_inputText);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String text, {bool isUser = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            text,
            style: TextStyle(color: isUser ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}

