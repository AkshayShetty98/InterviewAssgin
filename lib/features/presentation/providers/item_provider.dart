import 'package:flutter/foundation.dart';
import 'package:monocept/features/data/repositories/item_repository_impl.dart';
import 'package:monocept/features/domain/entity/item_entity.dart';
import 'package:monocept/features/domain/repository/item_repository.dart';

class ItemProvider with ChangeNotifier {
  final ItemRepository _itemRepository = ItemRepositoryImpl();
  List<ItemEntity> _items = [];

  List<ItemEntity> get items => _items;

  Future<void> fetchItems() async {
    _items = await _itemRepository.getItems();
    notifyListeners();
  }

  Future<void> addItem(ItemEntity item) async {
    await _itemRepository.addItem(item);
    fetchItems();
  }

  Future<void> updateItem(ItemEntity item) async {
    await _itemRepository.updateItem(item);
    fetchItems();
  }

  Future<void> removeItem(String id) async {
    await _itemRepository.removeItem(id);
    fetchItems();
  }
}
