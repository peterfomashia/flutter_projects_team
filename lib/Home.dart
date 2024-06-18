import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:learning_app/fitur/Challanges/TranslateGames/button_translate.dart';
import 'package:learning_app/fitur/Challanges/tmp.dart';
import 'package:learning_app/fitur/login_and_regist/login.dart';
import 'package:learning_app/fitur/profile/edit.dart';
import 'package:learning_app/fitur/profile/profile.dart';
import 'package:learning_app/fitur/profile/provider/profil_prov.dart';
import 'package:learning_app/fitur/profile/provider/switchProvider.dart';
import 'package:provider/provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;

  Widget bodyPage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Home Page'));
      case 1:
        return const Profile();
      default:
        return Container(); // Default widget if index is not found
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selected == 0
          ? AppBar(
              title: const Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            )
          : null,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Consumer<ProfilProv>(builder: (context, value, _) {
              return UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.example.com/background.jpg"), // Change with your image url
                    fit: BoxFit.cover,
                  ),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 60,
                  ),
                ),
                accountName: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      value.profil.isNotEmpty
                          ? value.profil[0].nama
                          : 'Nama Pengguna',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                accountEmail: Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      value.profil.isNotEmpty
                          ? value.profil[0].email
                          : 'email@domain.com',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text('Edit Profile',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Edit()));
              },
            ),
            const Divider(),
            SwitchListTile(
                title: const Text(
                  'Dark Mode',
                ),
                value: Provider.of<SwitchModeProvider>(context, listen: false)
                    .darkMode,
                onChanged: (bool val) {
                  Provider.of<SwitchModeProvider>(context, listen: false)
                      .toggleTheme();
                }),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            ListTile(
              trailing: const Icon(Icons.logout, color: Colors.blue),
              title: const Text('Logout',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        childMargin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: const Icon(Icons.add),
        onOpen: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Challange(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          bodyPage(selected),
          if (selected == 0)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Masih Wacana..",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ButtonTranslate()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      fixedSize: const Size(200, 30),
                      elevation: 5,
                    ),
                    child: const Text("Bermain"),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: const Color(0xff202020),
        activeIndex: selected,
        icons: const [
          Icons.home,
          Icons.arrow_circle_left,
        ],
        gapLocation: GapLocation.center,
        activeColor: Colors.blue,
        inactiveColor: Colors.white,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (int index) {
          setState(() {
            selected = index;
          });
        },
      ),
    );
  }
}
