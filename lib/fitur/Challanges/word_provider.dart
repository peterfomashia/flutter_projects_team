import 'dart:convert';

class WordProvider {
  static Future<Map<String, dynamic>> fetchWords() async {
    List<Map<String, dynamic>> words = [
      {'id': 1, 'ind': 'saya', 'eng': 'I'},
      {'id': 2, 'ind': 'lebih', 'eng': 'more'},
      {'id': 3, 'ind': 'menyukai', 'eng': 'like'},
      {'id': 4, 'ind': 'teh', 'eng': 'tea'},
      {'id': 5, 'ind': 'daripada', 'eng': 'than'},
      {'id': 6, 'ind': 'kopi', 'eng': 'coffee'},
    ];

    Map<String, dynamic> data = {
      'bahasa_indo': 'saya lebih menyukai teh daripada kopi',
      'bahasa_inggris': 'I more like tea than coffee',
      'kata': words,
    };

    return Future.value(data);
  }
}
