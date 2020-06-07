import 'package:aula12/app/modules/home/home_controller.dart';
import 'package:aula12/app/modules/home/home_page.dart';
import 'package:aula12/app/modules/home/widgets/post_card/post_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  HomeController controller;
  setUp(() {
    controller = HomeController();
  });
  group("Home Page Test", () {
    testWidgets("Home Page - Init, Title, FAB", (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));

      expect(find.text("Home Page"), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(
          find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets("Home Page - Click FAB", (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      await tester.tap(find.byType(FloatingActionButton));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.byType(PostCardWidget), findsNWidgets(2));
      expect(find.widgetWithText(PostCardWidget, "Title 1"), findsNWidgets(1));
    });
  });
}
