import 'package:flutter/material.dart';

class CardTileTwo extends StatefulWidget {
  final String title;
  CardTileTwo({Key key, this.title}) : super(key: key);

  @override
  _CardTileTwoState createState() => _CardTileTwoState();
}

class _CardTileTwoState extends State<CardTileTwo> {
  var _selected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _selected ? Colors.green : Colors.white,
      child: ListTile(
        title: Text(widget.title),
        onTap: () {
          _selected = !_selected;
          setState(() {});
        },
      ),
    );
  }
}
