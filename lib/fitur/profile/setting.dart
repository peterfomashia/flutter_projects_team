import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  final int dataProfil;
  const Settings({super.key, required this.dataProfil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text("Settings", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 100, top: 80),
        child:
        Hero(
          tag: "foto$dataProfil",
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 90,
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                image:
                DecorationImage(image: NetworkImage(profil[dataProfil].picture))),
             ),
          ),
          ),
      ),
      );
  }
}


class CekProfil {
  String picture;
  String nama;
  String email;
  String noTelp;
  String alamat;

  CekProfil({required this.picture ,required this.nama, required this.email, required this.noTelp, required this.alamat});
}

List<CekProfil> profil = [
  CekProfil(
    picture: "https://smpn3girimulyo.sch.id/media_library/images/078cef7e0da81598b49794ea180ade91.png",
    nama: "Muhammad Fauzan",
    email: "mhdfauzan@abc.com",
    noTelp: "08123456789",
    alamat: "Jl. Raya No. 123",
  ),
];
