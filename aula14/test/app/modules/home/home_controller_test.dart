
import 'package:flutter_test/flutter_test.dart';

import '../../../../lib/app/modules/home/home_controller.dart';


void main() {
   HomeController controller;
  
  setUp(() {
       controller = HomeController();
  });

  group('HomeController Test', () {
      test("First Test", () {
        expect(controller, isInstanceOf<HomeController>());
      });

      test('Value initiliazed', (){
        expect(controller.value, 0);
      });

      test('Increment value',(){
        controller.increment();
        expect(controller.value, 1);
      });
    
  });
}
