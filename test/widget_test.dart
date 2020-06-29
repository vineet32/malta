// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:malta/pages/decision_page.dart';

void main(){
  Widget makeTestableWidget ({Widget child}) {
    return MaterialApp(home: child);
  }
   testWidgets('Decision page Test', (WidgetTester tester) async {
   DecisionPage decision = DecisionPage();
   await tester.pumpWidget(makeTestableWidget(child: decision));
   expect(find.byKey(Key('parseCloudIcon')), findsOneWidget);
   expect(find.byKey(Key('serverStateText')), findsOneWidget);
 });
}