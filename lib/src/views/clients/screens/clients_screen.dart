import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../forms/client_form.dart';
import '../widgets/widgets.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});
  static const routeName = 'clients';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: const CustomAppbar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: ClientsList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ClientForm(),
          );
        },
      ),
    );
  }
}
