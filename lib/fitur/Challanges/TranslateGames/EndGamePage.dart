import 'package:flutter/material.dart';
import 'package:learning_app/Home.dart';
import 'package:learning_app/fitur/Challanges/TranslateGames/button_translate.dart';
import 'package:learning_app/fitur/Challanges/tmp.dart';

class EndGamePage extends StatelessWidget {
  final int points;

  const EndGamePage({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Over'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Kamu berhasil menyelesaikan permainan!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tampilkan skor
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Skor Akhir'),
                      content: Text('Total Skor: $points'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Tutup',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Challange()));
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: Text(
                            "Main ke Level Berikutnya",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(130, 40),
                  side: BorderSide(color: Colors.black)),
              child: Text('Hitung Skor',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
            SizedBox(height: 20), // Menambahkan jarak vertikal antara tombol
            ElevatedButton(
              onPressed: () {
                // Bermain lagi
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ButtonTranslate()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(120, 40),
                  side: BorderSide(color: Colors.black)),
              child: Text('Bermain Lagi',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            SizedBox(height: 20), // Menambahkan jarak vertikal antara tombol
            ElevatedButton(
              onPressed: () {
                // Kembali
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(140, 40),
                  side: BorderSide(color: Colors.black)),
              child: Text('Kembali',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
            SizedBox(height: 40),
            Divider(
                color: Colors.black, // Warna garis
                thickness: 2, // Ketebalan garis (dalam satuan logical pixels)
                height: 10,
                indent: 200,
                endIndent: 50),
            SizedBox(height: 5),
            Divider(
                color: Colors.black, // Warna garis
                thickness: 2, // Ketebalan garis (dalam satuan logical pixels)
                height: 10,
                indent: 100,
                endIndent: 50),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
