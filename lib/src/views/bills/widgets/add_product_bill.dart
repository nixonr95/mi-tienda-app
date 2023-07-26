import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../products/products.dart';
import 'add_product_dialog.dart';

class AddProductBill extends HookWidget {
  final Function(List<Product>) onSelectProducts;
  const AddProductBill({super.key, required this.onSelectProducts});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Agregar producto'),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.qr_code_scanner),
              color: primaryColor,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add),
              color: primaryColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddProductDialog(
                    onSelectProducts: onSelectProducts,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
