import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './_servicesintermediate.dart';

class ButtonTransferIntermediate extends StatelessWidget {
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
        title: Text('Intermediate Level'),
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
                Consumer<IntermediateButtonListProvider>(
                  builder: (context, clickedProvider, _) {
                    if (clickedProvider.indexing >=
                        clickedProvider.elementList.length) {
                      // Pop up if clearly
                      return Center(
                        child: Container(
                            //
                            ),
                      );
                    } else {
                      // Displaying a Sentence
                      return Container(
                        // color: Colors.blue,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black, width: 2)),
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          clickedProvider.elementList[clickedProvider.indexing]
                              ['kalimat'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<IntermediateButtonListProvider>(
                  builder: (context, clickedProvider, _) {
                    return Container(
                      width: 400,
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blueGrey, width: 1)),
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
                                        horizontal: 10.0),
                                    child: Text('${item['word']}'),
                                  ),
                                )
                              : SizedBox.shrink();
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Consumer<IntermediateButtonListProvider>(
                  builder: (context, clickedProvider, _) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      // color: Colors.grey[200],
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
                                  child: Text('${item['word']}'),
                                )
                              : SizedBox.shrink();
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<IntermediateButtonListProvider>()
                            .updateIndexElement();
                      },
                      label: Text("Check"),
                      icon: Icon(Icons.arrow_forward_ios),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        fixedSize: Size(200, 30),
                        elevation: 5,
                        shadowColor: Colors.red,
                      ),
                    ),
                    SizedBox(width: 45),
                  ],
                ),
              ],
            ),
            Consumer<IntermediateButtonListProvider>(
              builder: (context, clickedProvider, _) {
                if (clickedProvider.showAnimation) {
                  return _buildAnimationBox(
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
                          style: TextStyle(color: Colors.white, fontSize: 18),
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

class AnimatedButton extends StatelessWidget {
  final int index;
  final VoidCallback onPressed;
  final Widget child;

  AnimatedButton({
    required this.index,
    required this.onPressed,
    required this.child,
  });

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
      child: IntrinsicWidth(
        // adding IntrinsicWidth
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.blue), // background color button
            foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white), // color of text
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0)), // adding padding horizontal and vertikal
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), //
              ),
            ),
          ),
          child: child, // display the child of 'word'
        ),
      ),
    );
  }
}

Widget _buildAnimationBox({
  required bool show,
  required Color color,
  required IconData icon,
}) {
  return Center(
    child: AnimatedOpacity(
      opacity: show ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: color.withOpacity(0.82),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          size: 100,
          color: Colors.white,
        ),
      ),
    ),
  );
}
