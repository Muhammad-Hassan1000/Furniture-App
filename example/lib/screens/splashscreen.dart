import 'package:arcore_flutter_plugin_example/screens/itemListScreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  static const routeName = '/MySplashScreen';
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: ItemListScreen(),
      title: Text('AR FURNITURE APP',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: Colors.pink
      ),
      ),
      image: Image.asset('items/icon.png'),
      backgroundColor: Colors.white,
      photoSize: 180,
      loaderColor: Colors.red,
      loadingText: Text(
        'from coding cafe',
        style: TextStyle(
          color: Colors.pinkAccent,
          fontSize: 16.0,
        ),
      ),
      
    );
  }
}