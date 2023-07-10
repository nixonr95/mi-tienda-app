import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../products.dart';
import '../providers/product_provider.dart';

class DeleteProduct extends ConsumerWidget {
  final Product product;
  const DeleteProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productRepository = ref.watch(productRepositoryProvider).value;
    return AlertDialog(
      content: SizedBox(
        child: Text(
          '¿Está seguro que desea eliminar el producto ${product.name}?',
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
            await productRepository!.deleteProduct(product.id);
            ref.refresh(productsProvider);
            Navigator.pop(context);
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
