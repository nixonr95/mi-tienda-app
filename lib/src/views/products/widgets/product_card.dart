import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../categories/providers/category_provider.dart';
import '../forms/product_form.dart';
import '../products.dart';
import 'delete_product.dart';

class ProductCard extends HookConsumerWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider).value;
    final primayColor = Theme.of(context).primaryColor;
    final category = useMemoized(() {
      if (categories == null || categories.isEmpty) return '';
      final indexCategory = categories.indexWhere(
        (element) => element.id == product.categoryId,
      );
      return indexCategory == -1 ? '' : categories[indexCategory].name;
    }, [categories, product.categoryId]);

    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: const TextStyle(fontSize: 20.0),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: primayColor),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ProductForm(product: product),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => DeleteProduct(product: product),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          Text(
            'Categoría: $category',
            style: const TextStyle(fontSize: 15.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Precio: \$${product.price}',
                style: const TextStyle(fontSize: 15.0),
              ),
              Text(
                '  Cantidad: ${product.quantity}',
                style: const TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
