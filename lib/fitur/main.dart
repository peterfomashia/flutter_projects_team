import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => ClickedButtonListProvider()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('Provider Example'),
          ),
          body: Center(
            child: ButtonTransfer(),
          ),
        ),
      ),
    );
  }
}

class ClickedButtonListProvider with ChangeNotifier {
  int indexing = 0;
  List<Map> firstContainer = [];
  List<dynamic> elementList = [];
  List element = [];

  ClickedButtonListProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/example.json');
      elementList = jsonDecode(jsonString);
      element = elementList[indexing]['words'];
      element.shuffle();
    } catch (e) {
      print('Error loading JSON: $e');
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

void updateElement(access, _id) {
  for (var e in element) {
    if (e['id'] == _id) {
      e['cursor'] = !access;
      notifyListeners();
      break;
    }
  }
}


  void updateIndexElement() {
    if (indexing < elementList.length) {
      indexing += 1;
      firstContainer = [];
      element = elementList[indexing]['words'];
      element.shuffle();
      notifyListeners();
    }
    else {
      print('Element Already Reach maximum capacity');
    }
  }
}

class ButtonTransfer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var useState = Provider.of<ClickedButtonListProvider>(context);
    print('this element  ${useState.element}');
    print('this container ${useState.firstContainer}');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<ClickedButtonListProvider>(
          builder: (context, clickedProvider, _) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.blue,
              child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: clickedProvider.firstContainer.map((item) {
                    return item['cursor']
                        ? AnimatedButton(
                            index: item['id'],
                            onPressed: () {
                              bool access = item['cursor'];
                              clickedProvider.updateElement(access, item['id']);
                              clickedProvider.updateFirstContainer(access, item);
                            },
                            child: Text('${item['word']} ${item['id']}'),
                          )
                        : SizedBox.shrink();
                  }).toList()),
            );
          },
        ),
        SizedBox(height: 20),
        Consumer<ClickedButtonListProvider>(
          builder: (context, clickedProvider, _) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.green,
              child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: clickedProvider.element.map((item) {
                    int index = clickedProvider.element.indexOf(item);
                    return !item['cursor']
                        ? AnimatedButton(
                            index: index + 1,
                            onPressed: () {
                              bool access = item['cursor'];
                              clickedProvider.updateElement(access, item['id']);
                              clickedProvider.updateFirstContainer(access, item);
                            },
                            child: Text('${item['word']} ${item['id']}'),
                          )
                        : SizedBox.shrink();
                  }).toList()),
            );
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                useState.updateIndexElement();
              },
              label: Text("Enter"),
              icon: Icon(Icons.arrow_forward_ios),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                fixedSize: Size(200, 30),
                elevation: 5,
                shadowColor: Colors.red,
              ),
            ),
            SizedBox(width: 45)
          ],
        )
      ],
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final int index;
  final VoidCallback onPressed;
  final Widget child;

  AnimatedButton(
      {required this.index, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, 50.0 * value),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
