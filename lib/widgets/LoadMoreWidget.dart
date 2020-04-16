import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadMoreWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

class LoadMoreWidgetState extends State<LoadMoreWidget>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}