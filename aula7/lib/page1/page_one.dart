import 'package:aula7/shared/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

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
  var listObservable = BehaviorSubject<List<Data>>.seeded([]);

  @override
  void dispose() {
    listObservable.close();
    super.dispose();
  }

  void addItem() {
    var list = listObservable.value;
    list.add(Data("Item ${list.length}"));
    listObservable.sink.add(list);
  }

  void selectedItem(int index) {
    var list = listObservable.value;
    list[index].selected = !list[index].selected;
    listObservable.sink.add(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Data>>(
          stream: listObservable,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => CardTile(
                  data: snapshot.data[index],
                  onTap: () {
                    snapshot.data[index].selected =
                        !snapshot.data[index].selected;
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
