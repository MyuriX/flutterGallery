import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttergallery/tab/NestedTabBar.dart';

void main() => runApp(TabViewScreen());

class TabViewScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter NestedScrollView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin /*<-- This is for the controllers*/ {
  TabController _tabController; // To control switching tabs
  ScrollController _scrollViewController; // To control scrolling

  List<String> items = [];
  List<Color> colors = [Colors.red, Colors.green, Colors.yellow, Colors.purple, Colors.blue, Colors.amber, Colors.cyan, Colors.pink];
  Random random = new Random();

  Color getRandomColor() {
    return colors.elementAt(random.nextInt(colors.length));
  }

  @override
  void initState() {
    super.initState();
    _tabController =TabController(vsync: this, length: 2);
    _scrollViewController =ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Init the items
    for (var i = 0; i < 100; i++) {
      items.add('Item $i');
    }

    return new Scaffold(
      body: new NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              title: new Text(widget.title),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: new TabBar(
                tabs: <Tab>[
                  new Tab(text: "Colors"),
                  new Tab(text: "Items"),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Color color = getRandomColor();
                return Container(
                  height: 150.0,
                  color: color,
                  child: Text(
                    "Row $index",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),

            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                    ),
                    title: Text(
                        items.elementAt(index)
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

