import 'package:aula7/shared/widgets/card_tile_two.dart';
import 'package:flutter/material.dart';

class TwoPage extends StatefulWidget {
  TwoPage({Key key}) : super(key: key);

  @override
  _TwoPageState createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  var list = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => CardTileTwo(title: list[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.add("Item ${list.length}");
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
