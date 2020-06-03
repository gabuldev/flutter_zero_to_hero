import 'package:aula8/page1/page_one.dart';
import 'package:aula8/page2/page_two.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("MobX"),
          bottom: TabBar(tabs: [
            Tab(
              child: Text("Page 1"),
            ),
            Tab(
              child: Text("Page 2"),
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[OnePage(), TwoPage()],
        ),
      ),
    );
  }
}
