import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_app/Home.dart';
import 'package:learning_app/fitur/profile/edit.dart';
import 'package:learning_app/fitur/profile/provider/profil_prov.dart';
import 'package:learning_app/fitur/profile/setting.dart';
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
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 80,
                  ),
                  radius: 80,
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
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Text(
                          value.profil[index].email,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Colors.black),
                        ),
                      ],
                    );
                  },),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Edit()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child:
                    const Text(
                      "Edit Profile",
                      style:
                        TextStyle(
                            color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.control_point_rounded, size: 30, color: Colors.blue,),
                      SizedBox.fromSize(size: Size(20, 0)),
                      Text(
                        "Cek Point",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Settings(dataProfil: 0)));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.settings, size: 30, color: Colors.blue,),
                      SizedBox.fromSize(size: Size(20, 0)),
                      Text(
                        "Setting",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.help, size: 30, color: Colors.blue,),
                      SizedBox.fromSize(size: Size(20, 0)),
                      Text(
                        "Bantuan",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                TextButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                },
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 30, color: Colors.blue,),
                      SizedBox.fromSize(size: Size(20, 0)),
                      Text(
                        "Logout",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      })
    );
  }
}

