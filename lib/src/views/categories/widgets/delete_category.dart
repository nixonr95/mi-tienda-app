import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../categories.dart';
import '../providers/category_provider.dart';

class DeleteCategory extends ConsumerWidget {
  final Category category;
  const DeleteCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryRepository = ref.watch(categoryRepositoryProvider).value;
    return AlertDialog(
      content: SizedBox(
        child: Text(
          '¿Está seguro que desea eliminar la categoría ${category.name}?',
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () async {
            await categoryRepository!.deleteCategory(category.id);
            ref.refresh(categoriesProvider);
            Navigator.pop(context);
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
