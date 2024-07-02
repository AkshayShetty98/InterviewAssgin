import 'package:flutter/material.dart';
import 'package:monocept/features/presentation/pages/item_detail_page.dart';
import 'package:monocept/features/presentation/providers/item_provider.dart';
import 'package:monocept/features/presentation/widgets/custom_fab.dart';
import 'package:provider/provider.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Tracker'),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  itemProvider.removeItem(item.id).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.name} dismissed')));
                  });
                },
                child: Card(
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailPage(item: item),
                        ),
                      );
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        itemProvider.removeItem(item.id);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: CustomFab(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ItemDetailPage(item: null),
            ),
          );
        },
        // child: const Icon(Icons.add),
      ),
    );
  }
}
