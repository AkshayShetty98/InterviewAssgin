import 'package:flutter_test/flutter_test.dart';
import 'package:monocept/features/domain/entity/item_entity.dart';
import 'package:monocept/features/presentation/providers/item_provider.dart';

void main() {
  late ItemProvider itemProvider;

  group('Check Functionalities', () {
    setUp(() {
      itemProvider = ItemProvider();
    });
    test('Add Item', () async {
      final item = ItemEntity(
          id: '1', name: 'Test Item', description: 'Test Description');

      await itemProvider.addItem(item);

      expect(itemProvider.items.contains(item), false);
    });

    test('Update Item', () async {
      final item = ItemEntity(
          id: '1', name: 'Test Item', description: 'Test Description');

      await itemProvider.addItem(item);
      final updatedItem = ItemEntity(
          id: '1', name: 'Updated Item', description: 'Updated Description');

      await itemProvider.updateItem(updatedItem);

      expect(itemProvider.items.contains(updatedItem), true);
      expect(itemProvider.items.contains(item), false);
    });

    test('Remove Item', () async {
      final item = ItemEntity(
          id: '1', name: 'Test Item', description: 'Test Description');

      await itemProvider.addItem(item);
      await itemProvider.removeItem(item.id);

      expect(itemProvider.items.contains(item), false);
    });
  });
}
