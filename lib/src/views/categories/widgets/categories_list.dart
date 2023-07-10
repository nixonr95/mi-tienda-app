import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/category_provider.dart';
import 'category_card.dart';

class CategoriesList extends ConsumerWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    return categories.when(
        data: (data) {
          return Column(
            children: [
              const Text(
                'Categorías',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              if (data.isEmpty) const Text('No hay categorías'),
              ...data.map((categoria) {
                return Column(
                  children: [
                    CategoryCard(category: categoria),
                    const SizedBox(height: 20.0),
                  ],
                );
              }),
            ],
          );
        },
        error: (error, stackTrace) => const Center(child: Text('Error')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
