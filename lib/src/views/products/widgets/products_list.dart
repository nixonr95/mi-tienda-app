import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/product_provider.dart';
import 'product_card.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productos = ref.watch(productsProvider);
    return productos.when(
        data: (data) {
          return Column(
            children: [
              const Text(
                'Productos',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              if (data.isEmpty) const Text('No hay productos'),
              ...data.map((producto) {
                return Column(
                  children: [
                    ProductCard(product: producto),
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
