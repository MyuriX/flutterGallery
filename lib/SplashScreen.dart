import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergallery/gallery/GalleryViewScreen.dart';
import 'package:fluttergallery/tab/TabViewScreen.dart';
import 'package:fluttergallery/tab/WithoutTabView.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 155.0),
              RaisedButton(
                child: Text('Gallery'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GalleryViewScreen()));
                },
              ),
              RaisedButton(
                child: Text('Tab List'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TabViewScreen()));
                },
              ),
              RaisedButton(
                child: Text('List'),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WithoutTabView()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
