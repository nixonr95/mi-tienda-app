import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/widgets/qr_scanner.dart';
import '../../../shared/widgets/widgets.dart';
import '../forms/product_form.dart';
import '../products.dart';
import '../providers/product_provider.dart';
import '../widgets/products_list.dart';

class ProductsScreen extends HookConsumerWidget {
  const ProductsScreen({super.key});
  static const routeName = 'products';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productRepository = ref.watch(productRepositoryProvider).value;
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: const CustomAppbar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: ProductsList(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'scan-products',
            child: const Icon(Icons.qr_code_scanner),
            onPressed: () async {
              await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return QrScanner(
                    route: routeName,
                    onScan: (result) async {
                      Navigator.pop(context);
                      Product? producto;
                      if (result.isNotEmpty) {
                        producto = await productRepository!
                            .getProductByBarCode(result);
                      }
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) =>
                            ProductForm(product: producto, barCode: result),
                      );
                      return 'ok';
                    },
                  );
                },
              ));
            },
          ),
          const SizedBox(width: 10.0),
          FloatingActionButton(
            heroTag: 'add-products',
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ProductForm(),
              );
            },
          ),
        ],
      ),
    );
  }
}
