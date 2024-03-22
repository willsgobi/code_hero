// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:code_hero/src/pages/home_page.dart';
import 'package:code_hero/src/pages/widgets/header_widget.dart';
import 'package:code_hero/src/pages/widgets/hero_list.dart';
import 'package:code_hero/src/pages/widgets/pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage renders correctly', (WidgetTester tester) async {
    // Build our widget
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.byType(HeaderWidget), findsOneWidget);

    expect(find.byType(HeroList), findsOneWidget);

    expect(find.byType(Pagination), findsNothing);

    final ValueNotifier<int> totalHeros = ValueNotifier<int>(5);
    await tester.pumpWidget(MaterialApp(
      home: ValueListenableBuilder<int>(
        valueListenable: totalHeros,
        builder: (_, __, ___) => const HomePage(),
      ),
    ));
  });
}
