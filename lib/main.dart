import 'package:flutter/material.dart';
import 'package:fluttergallery/gallery/GalleryViewScreen.dart';
import 'package:fluttergallery/SplashScreen.dart';
import 'package:fluttergallery/tab/TabViewScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      SplashScreen(),
    );
  }
}

