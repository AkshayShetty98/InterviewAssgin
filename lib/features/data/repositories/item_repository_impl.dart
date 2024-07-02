import 'package:monocept/features/domain/entity/item_entity.dart';
import 'package:monocept/features/domain/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final List<ItemEntity> _items = [];

  @override
  Future<List<ItemEntity>> getItems() async {
    return _items;
  }

  @override
  Future<void> addItem(ItemEntity item) async {
    _items.add(item);
  }

  @override
  Future<void> updateItem(ItemEntity item) async {
    int index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _items[index] = item;
    }
  }

  @override
  Future<void> removeItem(String id) async {
    _items.removeWhere((item) => item.id == id);
  }
}
