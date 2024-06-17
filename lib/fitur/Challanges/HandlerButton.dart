import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'beginner/Sentences.dart';
import 'beginner/_servicesBeginner.dart';

import 'advance/SentencesAdvance.dart';
import 'advance/_servicesiAdvance.dart';

import 'intermediate/SentencesIntermediate.dart';
import 'intermediate/_servicesintermediate.dart';

class HandlerButton extends StatelessWidget {
  const HandlerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handler Button'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<BeginnerButtonListProvider>(
              builder: (context, state, _) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ButtonTransferBeginner(),
                      ),
                    ).then((_) {
                      Navigator.pop(
                          context); // Kembali ke halaman Tmp setelah kembali dari ButtonTransferBeginner
                    });
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white, // Warna latar belakang
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, size: 120, color: Colors.blue),
                          SizedBox(height: 10),
                          Text(
                            'Beginner',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),


            // Intermediate Level
            Consumer<IntermediateButtonListProvider>(
              builder: (context, state, _) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ButtonTransferIntermediate(),
                      ),
                    ).then((_) {
                      Navigator.pop(
                          context); // Kembali ke halaman Tmp setelah kembali dari ButtonTransferIntermediate
                    });
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white, // Warna latar belakang
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.directions_walk,
                              size: 120, color: Colors.orange),
                          SizedBox(height: 10),
                          Text(
                            'Intermediate Level',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            // Advanced Level
            Consumer<AdvanceButtonListProvider>(
              builder: (context, state, _) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ButtonTransferAdvance(),
                      ),
                    ).then((_) {
                      Navigator.pop(
                          context); // Kembali ke halaman Tmp setelah kembali dari ButtonTransferAdvance
                    });
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white, // Warna latar belakang
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.school, size: 120, color: Colors.green),
                          SizedBox(height: 10),
                          Text(
                            'Advanced Level',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
