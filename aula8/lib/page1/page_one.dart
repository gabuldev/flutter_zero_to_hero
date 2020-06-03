import 'package:aula8/shared/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart' as mobx;

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
  mobx.ObservableList<Data> list = <Data>[].asObservable();
  mobx.Action addItem;

  @override
  void initState() {
    addItem = mobx.Action(_addItem);
    super.initState();
  }

  void _addItem() {
    list.add(Data("Item ${list.length}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        if (list.isNotEmpty) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => CardTile(
              data: list[index],
              onTap: () {
                list[index].selected = !list[index].selected;
              },
            ),
          );
        } else {
          return Container();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
