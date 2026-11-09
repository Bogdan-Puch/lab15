import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab15/main.dart'; // Заміни 'lab15' на назву твого пакету з pubspec.yaml

void main() {
  group('Function Calculation Tests (Variant 16)', () {
    test('Calculate function correctly for x = 2', () {
      final calculator = FunctionCalculator();
      // (2^2 - 2) / 2^3 = (4 - 2) / 8 = 2 / 8 = 0.25
      expect(calculator.calculate(2.0), closeTo(0.25, 0.001));
    });

    test('Calculate function correctly for x = 4', () {
      final calculator = FunctionCalculator();
      // (4^2 - 4) / 4^3 = (16 - 4) / 64 = 12 / 64 = 0.1875
      expect(calculator.calculate(4.0), closeTo(0.1875, 0.001));
    });
  });

  group('UI and Widget Tests (Variant 16)', () {
    testWidgets('Check title widget template for last Flutter App', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Перевіряємо наявність віджета з текстом шаблону <Group>: <Name>'s last Flutter App
      expect(find.text("32-ICT: Bogdan's last Flutter App"), findsWidgets);
    });

    testWidgets('Check FloatingActionButton icon is Icons.pets', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Перевіряємо наявність іконки лапок для варіанта 16
      expect(find.byIcon(Icons.pets), findsOneWidget);
    });

    testWidgets('Check counter step value is 2', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Початкове значення лічильника
      expect(find.text('0'), findsOneWidget);
      expect(find.text('2'), findsNothing);

      // Натискаємо кнопку
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      // Після одного натискання крок 2 додається до 0, сума стає 2
      expect(find.text('0'), findsNothing);
      expect(find.text('2'), findsOneWidget);
    });
  });
}