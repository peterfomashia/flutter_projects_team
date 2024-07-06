import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: FlameSplashScreen(
        theme: FlameSplashTheme.white,
        onFinish: (context) => Navigator.of(context).pushReplacementNamed('/login'),
        showBefore: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: 'assets/images/logo.png',
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Pembelajaran Bahasa Inggris',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              SpinKitThreeBounce(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          );
        },
        showAfter: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.school,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
