import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../products/products.dart';
import '../../products/providers/product_provider.dart';

class AddProductDialog extends HookConsumerWidget {
  final Function(List<Product>) onSelectProducts;
  const AddProductDialog({super.key, required this.onSelectProducts});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final productsSelected = useState<List<Product>>([]);
    final isChanging = useState(false);

    onChancheProduct(Product product) {
      isChanging.value = true;
      if (productsSelected.value.contains(product)) {
        productsSelected.value.remove(product);
      } else {
        productsSelected.value.add(product);
      }
      isChanging.value = false;
    }

    return AlertDialog(
      title: const Text('Seleccione los productos'),
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: const Text('Agregar'),
                onPressed: () {
                  onSelectProducts(productsSelected.value);
                  Navigator.pop(context, productsSelected.value);
                },
              ),
            ],
          ),
          products.when(
            data: (data) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20.0),
                    ...data.map((e) {
                      return !isChanging.value
                          ? CheckboxListTile(
                              onChanged: (value) => onChancheProduct(e),
                              value: productsSelected.value.contains(e),
                              title: Text('Nombre: ${e.name}'),
                              subtitle: Text('Precio: ${e.price}'),
                            )
                          : const SizedBox.shrink();
                    }),
                  ],
                ),
              );
            },
            error: (error, stackTrace) => const Center(child: Text('Error')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
