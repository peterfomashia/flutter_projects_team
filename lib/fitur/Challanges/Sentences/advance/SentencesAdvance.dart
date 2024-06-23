import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '_servicesiAdvance.dart';
import './componentsAdvance/AnimatedButton.dart';
import './componentsAdvance/SubmitButton.dart';
import './componentsAdvance/ProgressBar.dart';
import './componentsAdvance/LanguageIndicator.dart';
import './componentsAdvance/AnimationBox.dart';

class ButtonTransferAdvance extends StatefulWidget {
  @override
  _ButtonTransferAdvanceState createState() => _ButtonTransferAdvanceState();
}

class _ButtonTransferAdvanceState extends State<ButtonTransferAdvance> {
  Future<bool?> _showBackDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Are you sure you want to leave this page?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Nevermind'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              child: const Text('Leave'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advance Level'),
        backgroundColor: Colors.blue,
      ),
      body: WillPopScope(
        onWillPop: () async {
          final bool shouldPop = await _showBackDialog(context) ?? false;
          return shouldPop;
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ProgressBar(),
                SizedBox(height: 20),
                LanguageIndicator(),
                Consumer<AdvanceButtonListProvider>(
                  builder: (context, clickedProvider, _) {
                    if (clickedProvider.indexing >=
                        clickedProvider.elementList.length) {
                      return Center(
                        child: Container(
                            // pop up message
                            ),
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          clickedProvider.elementList[clickedProvider.indexing]
                              ['kalimat'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 20),
                Consumer<AdvanceButtonListProvider>(
                  builder: (context, clickedProvider, _) {
                    return Container(
                      width: 360,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blueGrey, width: 1),
                      ),
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
                                    clickedProvider.updateElement(
                                      access,
                                      item['id'],
                                    );
                                    clickedProvider.updateFirstContainer(
                                      access,
                                      item,
                                    );
                                    clickedProvider.updateListAnswer(
                                      0,
                                      item['id'],
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Text(
                                      '${item['word']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink();
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Consumer<AdvanceButtonListProvider>(
                  builder: (context, clickedProvider, _) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // width: 360,
                      height: 200,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: clickedProvider.element.map((item) {
                          return !item['cursor']
                              ? AnimatedButton(
                                  index: item['id'],
                                  onPressed: () {
                                    bool access = item['cursor'];
                                    clickedProvider.updateElement(
                                      access,
                                      item['id'],
                                    );
                                    clickedProvider.updateFirstContainer(
                                      access,
                                      item,
                                    );
                                    clickedProvider.updateListAnswer(
                                      1,
                                      item['id'],
                                    );
                                  },
                                  child: Text(
                                    '${item['word']}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              : SizedBox.shrink();
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                SubmitButton(),
              ],
            ),
            Consumer<AdvanceButtonListProvider>(
              builder: (context, clickedProvider, _) {
                if (clickedProvider.showAnimation) {
                  return buildAnimationBox(
                    show: clickedProvider.showAnimation,
                    color: clickedProvider.showCorrectAnimation
                        ? Color.fromARGB(255, 60, 150, 22)
                        : Colors.red.shade900,
                    icon: clickedProvider.showCorrectAnimation
                        ? Icons.check
                        : Icons.close,
                  );
                } else if (clickedProvider.showAllElementsExplored) {
                  Future.delayed(Duration(seconds: 2), () {
                    if (context.mounted) {
                      Navigator.pop(context);
                      clickedProvider.notify();
                    }
                  });
                  return Center(
                    child: Container(
                      width: 200,
                      height: 100,
                      color: Colors.black.withOpacity(0.7),
                      child: Center(
                        child: Text(
                          'All sentences explored!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
