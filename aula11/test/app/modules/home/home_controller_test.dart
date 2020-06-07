
import 'package:aula11/app/modules/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  HomeController controller;
  setUp((){
    controller = HomeController();
  });
  group("Home Controller Test", (){

    test("Posts is null",(){
      expect(controller.posts.value, isNull);
    });

    test("Posts is NotEmpty",() async{
      await controller.getPosts();
      final posts = controller.posts.value;
      expect(posts.length, 2);
      expect(posts[0].title, "Title 1");
    });



  });
  
}