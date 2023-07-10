import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../forms/product_form.dart';
import '../widgets/products_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  static const routeName = 'products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: const CustomAppbar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: ProductsList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ProductForm(),
          );
        },
      ),
    );
  }
}
