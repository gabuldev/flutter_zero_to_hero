import 'package:aula8/page1/page_one.dart';
import 'package:flutter/material.dart';

class CardTile extends StatefulWidget {
  final Data data;
  final Function onTap;
  CardTile({Key key, this.data, this.onTap}) : super(key: key);

  @override
  _CardTileState createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  var _selected = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _selected ? Colors.green : Colors.white,
      child: ListTile(
        title: Text(widget.data.text),
        onTap: () {
          _selected = !_selected;
          setState(() {});
          widget.onTap();
        },
      ),
    );
  }
}
