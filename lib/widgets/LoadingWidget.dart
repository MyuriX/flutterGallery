import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoadingWidgetState();

  }
}

class LoadingWidgetState extends State<LoadingWidget>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Pleaase wait...'),
          CircularProgressIndicator()
        ],
      ),
    );
  }

}
