import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../forms/category_form.dart';
import '../widgets/categories_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static const routeName = 'categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: const CustomAppbar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: CategoriesList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CategoryForm(),
          );
        },
      ),
    );
  }
}
