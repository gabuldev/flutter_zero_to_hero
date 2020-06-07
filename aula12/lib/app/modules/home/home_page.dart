import 'package:aula12/app/modules/home/home_controller.dart';
import 'package:aula12/app/modules/home/widgets/post_card/post_card_widget.dart';
import 'package:flutter/material.dart';

import 'models/post_model.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({Key key, this.controller}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller;

  @override
  void initState() {
    controller = widget.controller ?? HomeController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: controller.posts,
        builder: (context, posts, child) {
          if (posts == null) {
            return Center(child: CircularProgressIndicator());
          }
          else if(posts.isNotEmpty){
            return ListView.builder
            (itemCount: posts.length,
              itemBuilder: (context,index) => PostCardWidget(
                snapshot: posts[index]
              ));
          }else{
            return Center(child: Text("Lista vazia"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.getPosts,
        child: Icon(Icons.add),
      ),
    );
  }
}
