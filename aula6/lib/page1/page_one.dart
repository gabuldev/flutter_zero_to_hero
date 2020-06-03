import 'package:aula6/shared/widgets/card_tile.dart';
import 'package:flutter/material.dart';

class Data {
  final String text;
  bool selected;

  Data(this.text, {this.selected = false});
}

class OnePage extends StatefulWidget {
  OnePage({Key key}) : super(key: key);

  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  var list = <Data>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => CardTile(
          data: list[index],
          onTap: () {
            list[index].selected = !list[index].selected;
            setState(() {});
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.add(Data("Item ${list.length}"));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
