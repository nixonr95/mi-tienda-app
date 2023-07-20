import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import 'bill_form_screen.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});
  static const routeName = 'bills';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: const CustomAppbar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        // child: CategoriesList(),
        child: SizedBox(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, BillFormScreen.routeName);
        },
      ),
    );
  }
}
