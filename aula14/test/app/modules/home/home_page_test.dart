import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../lib/app/modules/home/home_controller.dart';
import '../../../../lib/app/modules/home/home_module.dart';
import '../../../../lib/app/modules/home/home_page.dart';

main() {
  initModule(HomeModule(),changeBinds: [
    Bind((i) => HomeController())
  ]);
  group('Home Page', (){
 testWidgets('HomePage initialized', (WidgetTester tester) async {
   await tester.pumpWidget(MaterialApp(home: HomePage(title: 'Home',)));
   expect(find.text('Home'), findsOneWidget);
   expect(find.text('COUNT'), findsOneWidget);
   expect(find.text('0'), findsOneWidget);
   expect(find.byType(FloatingActionButton), findsOneWidget);
   expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('HomePage Incremented', (WidgetTester tester) async {
  final controller = Modular.get<HomeController>();
   await tester.pumpWidget(MaterialApp(home: HomePage(title: 'Home',)));
  controller.increment();
  expect(controller.value, 1);
  await tester.pump();
  expect(find.text('1'), findsOneWidget);
  });

  });
 
}
