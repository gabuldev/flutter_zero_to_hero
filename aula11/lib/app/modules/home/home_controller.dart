

import 'package:aula11/app/modules/home/models/post_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController{
  final posts = ValueNotifier<List<PostModel>>(null);

Future<void> getPosts() async{
  await Future.delayed(Duration(seconds: 1));
  posts.value = [
    PostModel(
      title: "Title 1",
      subtitle: "Subtitle 1"
    ),
      PostModel(
      title: "Title 2",
      subtitle: "Subtitle "
    ),
     PostModel(
      title: "Title 3",
      subtitle: "Subtitle 3"
    ),
  ];
}

void dispose(){
  posts.dispose();
}
}