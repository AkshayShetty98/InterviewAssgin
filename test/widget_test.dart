// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monocept/features/domain/entity/item_entity.dart';
import 'package:monocept/features/presentation/pages/item_list_page.dart';
import 'package:monocept/features/presentation/providers/item_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('should display items', (WidgetTester tester) async {
    final itemProvider = ItemProvider();
    await itemProvider.addItem(ItemEntity(
        id: '1', name: 'Test ItemEntity', description: 'Test Description'));

    expect(find.text('Test ItemEntity'), findsNothing);
    expect(find.text('Test Description'), findsNothing);

    await tester.pumpWidget(
      ChangeNotifierProvider<ItemProvider>.value(
        value: itemProvider,
        child: const MaterialApp(home: ItemListPage()),
      ),
    );

    expect(find.text('Test ItemEntity'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
  });
}
