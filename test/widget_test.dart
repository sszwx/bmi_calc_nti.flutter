import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sf3/main.dart';

void main() {
  testWidgets('displays the gender cards', (WidgetTester tester) async {
    await tester.pumpWidget(const Bmi());

    expect(find.text('Male'), findsOneWidget);
    expect(find.text('Female'), findsOneWidget);
    expect(find.byIcon(Icons.male), findsOneWidget);
    expect(find.byIcon(Icons.female), findsOneWidget);
  });
}
