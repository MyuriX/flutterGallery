import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergallery/gallery/GalleryViewScreen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>{


  @override
  void initState() {
    super.initState();

  }

  startTime() async{
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration,autoOpen);
  }

  Future<void> autoOpen() async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => GalleryViewScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/photo_gallery_icon',
          width: 120,
          height: 120,
        ),
      ),
    );
  }

}