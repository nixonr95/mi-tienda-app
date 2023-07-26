import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bills.dart';

class ProductListBill extends HookWidget {
  final ValueNotifier<Bill?> bill;
  // final Bill bill;
  const ProductListBill({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    final products = useMemoized(() {
      return bill.value?.products ?? [];
    }, [bill.value]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Productos',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20.0),
        if (products.isEmpty) const Text('No hay productos'),
        ...products.map((product) {
          return Column(
            children: [
              ListTile(
                tileColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                title: Text(product.name ?? ''),
                subtitle: Text(product.price.toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          );
        }),
      ],
    );
  }
}
