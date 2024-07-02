import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monocept/features/domain/entity/item_entity.dart';
import 'package:monocept/features/presentation/providers/item_provider.dart';
import 'package:monocept/features/presentation/widgets/common_textfield.dart';
import 'package:monocept/utils/helpers/validators.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatefulWidget {
  final ItemEntity? item;

  const ItemDetailPage({super.key, this.item});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final GlobalKey<FormState> _formKey;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.item != null) {
      _titleController.text = widget.item!.name;
      _descriptionController.text = widget.item!.description;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? 'Add Item' : 'Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CommonTextField(
                controller: _titleController,
                textStyle: const TextStyle(),
                mode: autoValidateMode,
                labelName: 'Title',
                validatorFunction: (value) {
                  return Validators.required(value,
                      errorText: 'Title is required.');
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CommonTextField(
                controller: _descriptionController,
                textStyle: const TextStyle(),
                mode: autoValidateMode,
                labelName: 'Description',
                validatorFunction: (value) {
                  return Validators.required(value,
                      errorText: 'Description is required.');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final String id =
                        widget.item?.id ?? DateTime.now().toString();
                    final String name = _titleController.text;
                    final String description = _descriptionController.text;

                    final newItem = ItemEntity(
                        id: id, name: name, description: description);

                    if (widget.item == null) {
                      context.read<ItemProvider>().addItem(newItem);
                    } else {
                      context.read<ItemProvider>().updateItem(newItem);
                    }

                    Navigator.pop(context);
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: Text(widget.item == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
