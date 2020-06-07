
import 'package:flutter/cupertino.dart';

class HomeController{
  final count = ValueNotifier<int>(0);

  void increment(){
   count.value++;
    print(count.value);
    count.notifyListeners();
  }

  void dispose(){
    count.dispose();
  }
}