import 'package:flutter/material.dart';
import 'package:learning_app/fitur/profile/provider/profil_prov.dart';
import 'package:learning_app/fitur/profile/provider/switchProvider.dart';
import 'package:provider/provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:learning_app/fitur/Challanges/tmp.dart';
import 'package:learning_app/fitur/login_and_regist/login.dart';
import 'package:learning_app/fitur/profile/edit.dart';
import 'package:translator/translator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;
  final TextEditingController _controller = TextEditingController();
  String _translatedText = '';
  String _sourceLanguage = 'en';
  String _targetLanguage = 'id';

  void translateText() async {
    final translator = GoogleTranslator();
    var translation = await translator.translate(
      _controller.text,
      from: _sourceLanguage,
      to: _targetLanguage,
    );
    setState(() {
      _translatedText = translation.text;
    });
  }

  Widget bodyPage(int index) {
    switch (index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  _buildFeatureCard(),
                  const SizedBox(height: 20),
                  _buildTranslationCard(),
                ],
              ),
            ),
          ),
        );
      case 1:
        return const Login();
      default:
        return Container(); // Default widget if index is not found
    }
  }

  Widget _buildFeatureCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      shadowColor: Colors.black54,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Main Features',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  featureCard(
                    icon: Icons.translate,
                    title: 'Translation',
                    onTap: () {
                      // Action for Translation feature
                    },
                  ),
                  featureCard(
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Edit(),
                        ),
                      );
                    },
                  ),
                  featureCard(
                    icon: Icons.games,
                    title: 'Challenges',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Challange(),
                        ),
                      );
                    },
                  ),
                  // Add more feature cards here if needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTranslationCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      shadowColor: Colors.black54,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
            colors: [Colors.deepOrange, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter text to translate',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDropdownButton(_sourceLanguage, (value) {
                    setState(() {
                      _sourceLanguage = value!;
                    });
                  }),
                  const Icon(Icons.swap_horiz, color: Colors.white),
                  _buildDropdownButton(_targetLanguage, (value) {
                    setState(() {
                      _targetLanguage = value!;
                    });
                  }),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: translateText,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.deepOrange,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Translate'),
              ),
              const SizedBox(height: 20),
              Text(
                _translatedText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String value, void Function(String?)? onChanged) {
    return DropdownButton<String>(
      value: value,
      dropdownColor: Colors.orangeAccent,
      items: const [
        DropdownMenuItem(
          value: 'en',
          child: Text('English', style: TextStyle(color: Colors.white)),
        ),
        DropdownMenuItem(
          value: 'id',
          child: Text('Indonesian', style: TextStyle(color: Colors.white)),
        ),
      ],
      onChanged: onChanged,
    );
  }

  Widget featureCard({
    required IconData icon,
    required String title,
    required Function() onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        splashColor: Colors.blueAccent.withOpacity(0.2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selected == 0 ? "Home" : "Profile",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: selected == 0
            ? [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification action
            },
          ),
        ]
            : null,
      ),
      drawer: buildDrawer(context),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Challange()),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: bodyPage(selected),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Consumer<ProfilProv>(
            builder: (context, value, _) {
              return UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.example.com/background.jpg"), // Change with your image URL
                    fit: BoxFit.cover,
                  ),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Icon(Icons.person, color: Colors.blue, size: 60),
                ),
                accountName: Row(
                  children: [
                    const Icon(Icons.person, color: Colors.white),
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
                    const Icon(Icons.email, color: Colors.white),
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
            },
          ),
          buildDrawerListTile(
              context, Icons.edit, 'Edit Profile', const Edit()),
          const Divider(),
          buildSwitchListTile(context),
          const SizedBox(height: 30),
          const Divider(),
          ListTile(
            trailing: const Icon(Icons.logout, color: Colors.blue),
            title: const Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
    );
  }

  ListTile buildDrawerListTile(
      BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  SwitchListTile buildSwitchListTile(BuildContext context) {
    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: Provider.of<SwitchModeProvider>(context).darkMode,
      onChanged: (bool val) {
        Provider.of<SwitchModeProvider>(context, listen: false).toggleTheme();
      },
    );
  }

  AnimatedBottomNavigationBar buildBottomNavigationBar() {
    return AnimatedBottomNavigationBar(
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
    );
  }
}
