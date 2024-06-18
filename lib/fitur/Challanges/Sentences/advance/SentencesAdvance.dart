import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '_servicesiAdvance.dart';

class ButtonTransferAdvance extends StatelessWidget {
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
        title: Text('Provider Prototype - Beginner'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          final bool shouldPop = await _showBackDialog(context) ?? false;
          if (context.mounted && shouldPop) {
            Navigator.pop(context);
          }
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<AdvanceButtonListProvider>(
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
                                    clickedProvider.updateElement(
                                        access, item['id']);
                                    clickedProvider.updateFirstContainer(
                                        access, item);
                                    clickedProvider.updateListAnswer(
                                        0, item['id']);
                                  },
                                  child: Text('${item['word']} ${item['id']}'),
                                )
                              : SizedBox.shrink();
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Consumer<AdvanceButtonListProvider>(
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
                          return !item['cursor']
                              ? AnimatedButton(
                                  index: item['id'],
                                  onPressed: () {
                                    bool access = item['cursor'];
                                    clickedProvider.updateElement(
                                        access, item['id']);
                                    clickedProvider.updateFirstContainer(
                                        access, item);
                                    clickedProvider.updateListAnswer(
                                        1, item['id']);
                                  },
                                  child: Text('${item['word']} ${item['id']}'),
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
                            .read<AdvanceButtonListProvider>()
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
            Consumer<AdvanceButtonListProvider>(
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
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
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
