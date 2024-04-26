import 'package:flutter/material.dart';
import 'package:learning_app/fitur/profile/provider/profil_prov.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<ProfilProv>(builder: (context, value, child) {
        return Container(
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
                DecorationImage(image: NetworkImage(value.profil[dataProfil].picture), fit: BoxFit.cover),),
             ),
          ),
          ),
      );
      },)
      );
  }
}



