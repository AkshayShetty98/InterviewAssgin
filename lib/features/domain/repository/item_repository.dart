import 'package:monocept/features/domain/entity/item_entity.dart';

abstract class ItemRepository {
  Future<List<ItemEntity>> getItems();
  Future<void> addItem(ItemEntity item);
  Future<void> updateItem(ItemEntity item);
  Future<void> removeItem(String id);
}
