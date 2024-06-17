import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntermediateButtonListProvider with ChangeNotifier {
  int play = 0;
  int indexing = 0;
  List<Map> firstContainer = [];
  List<Map> elementList = [];
  List<Map> element = [];
  List<int> answer = [];
  Map<String, List<int>> groupAnswerCursor = {
    "A": [1, 2],
    "B": [1, 2, 3],
    "C": [1, 2, 3, 4],
    "D": [1, 2, 3, 4, 5],
  };

  bool showAnimation = false;
  bool showCorrectAnimation = false;
  bool showIncorrectAnimation = false;
  bool showAllElementsExplored = false;

  IntermediateButtonListProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/intermediate.json');
      elementList = List<Map>.from(jsonDecode(jsonString));
      element = List<Map>.from(elementList[indexing]['words']);
      element.shuffle();
    } catch (e) {
      print('Error loading JSON: $e');
    }
    notifyListeners();
  }

  void setPlay(int func) {
    if (func == 0) {
      play += 1;
    } else {
      play = 0;
    }
    notifyListeners();
  }

  void updateFirstContainer(bool access, Map item) {
    if (!access) {
      firstContainer.add(item);
    } else {
      firstContainer.removeWhere((element) => element['id'] == item['id']);
    }
    notifyListeners();
  }

  void updateElement(bool access, int _id) {
    for (var e in element) {
      if (e['id'] == _id) {
        e['cursor'] = !access;
        notifyListeners();
        break;
      }
    }
  }

  bool listsEqual(List<int> list1, List<int> list2) {
    if (list1.length != list2.length) {
      return false;
    }
    return list1
        .asMap()
        .entries
        .every((entry) => entry.value == list2[entry.key]);
  }

  void updateIndexElement() {
    List<int> currentAnswerCursor =
        groupAnswerCursor[elementList[indexing]['typeAns']] ?? [];
    if (indexing < elementList.length &&
        listsEqual(answer, currentAnswerCursor)) {
      showCorrectAnimation = true;
      showIncorrectAnimation = false;
      showAnimation = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
        if (indexing < elementList.length - 1) {
          element.forEach((e) => e['cursor'] = false);
        }
        showAnimation = false;
        showCorrectAnimation = false;
        indexing += 1;
        if (indexing < elementList.length) {
          firstContainer = [];
          answer = [];
          element = List<Map>.from(elementList[indexing]['words']);
          element.shuffle();
        } else {
          showAllElementsExplored = true;
        }
        notifyListeners();
      });
    } else if (indexing < elementList.length &&
        !listsEqual(answer, currentAnswerCursor)) {
      showCorrectAnimation = false;
      showIncorrectAnimation = true;
      showAnimation = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
        showAnimation = false;
        showIncorrectAnimation = false;
        notifyListeners();
      });
    } else {
      print('Element Already Reach maximum capacity');
    }
  }

  void updateListAnswer(int id, int index) {
    if (id == 0) {
      answer.removeWhere((element) => element == index);
    } else {
      answer.add(index);
    }
    notifyListeners();
  }

  void notify() {
    element.forEach((e) => e['cursor'] = false);
    indexing = 0;
    firstContainer = [];
    answer = [];
    showAnimation = false;
    showCorrectAnimation = false;
    showIncorrectAnimation = false;
    showAllElementsExplored = false;
    element = List<Map>.from(elementList[indexing]['words']);
    element.shuffle();
    notifyListeners();
  }
}
