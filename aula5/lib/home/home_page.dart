import 'package:flutter/material.dart';

import 'repositories/home_repository_impl.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final repository = HomeRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          bottom: TabBar(tabs: [
            Tab(
              text: "Future",
            ),
            Tab(
              text: "Stream",
            )
          ]),
        ),
        body: TabBarView(children: [
          FutureBuilder<List>(
              future: repository.getTarefas(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Erro aconteceu");
                } else if (snapshot.hasData) {
                  final list = snapshot.data;
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) => ListTile(
                            title: Text(list[index]['title']),
                          ));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Container(
            child: Text("SEM WEBSOCKET"),
          )
        ]),
      ),
    );
  }
}
