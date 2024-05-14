import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_app/Home.dart';
import 'package:learning_app/fitur/profile/edit.dart';
import 'package:learning_app/fitur/profile/provider/profil_prov.dart';
import 'package:learning_app/fitur/profile/switch.dart';
import 'package:learning_app/login_and_regist/login.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState  extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<ProfilProv>(builder: (context,value,_) {
        return Container(
        padding: EdgeInsets.only(top: 30, left: 20,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 60,
                ),
                radius: 60,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 75,
                child: ListView.builder(
                  itemCount: value.profil.length,
                  itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        value.profil[index].nama,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,),
                      ),
                      SizedBox(height: 10),
                      Text(
                        value.profil[index].email,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  );
                },),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Edit()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.white,),
                      SizedBox(width: 20,),
                      Text(
                        "Edit Profile",
                        style:
                          TextStyle(
                              color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Pengaturan", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SwitchScreenMode()));
                },
                child: Row(
                  children: [
                    Icon(Icons.switch_access_shortcut_add, color: Colors.blue,),
                    SizedBox.fromSize(size: Size(20, 0)),
                    Text(
                      "Switch",
                      style: TextStyle(fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      );
      })
    );
  }
}

