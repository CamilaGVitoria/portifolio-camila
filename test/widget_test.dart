import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio_camila/main.dart';

void main() {
  testWidgets('PortifolioCamila renderiza sem erros', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PortifolioCamila());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
