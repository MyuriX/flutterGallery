import 'package:flutter/cupertino.dart';

class NoDataWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NoDataWidgetState();
  }
}
class NoDataWidgetState extends State<NoDataWidget>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("No date found")
        ],
      ),
    );
  }

}

