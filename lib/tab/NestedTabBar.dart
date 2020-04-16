import 'package:flutter/material.dart';

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
              color: Colors.indigo,
          ),
          indicatorWeight: 1,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 1)),
                child: Align(
                  widthFactor: 1,
                  alignment: Alignment.center,
                  child: Text("All"),
                ),
              ),

//              text: "All",
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 1)),
                child: Align(
                  widthFactor: 1,

                  alignment: Alignment.center,
                  child: Text("credit"),
                ),
              ),

//              text: "Two",
            ),
            Tab(
              child: Container(
//                decoration: BoxDecoration(
//                    border: Border.all(color: Colors.indigo, width: 1)),
                child: Align(
                  widthFactor: 1,

                  alignment: Alignment.center,
                  child: Text("debit"),
                ),
              ),

//              text: "Three",
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.70,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blueAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.orangeAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
