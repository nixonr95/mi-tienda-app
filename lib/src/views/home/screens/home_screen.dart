import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppbar(),
      body: Center(
        child: Text('Hello home!'),
      ),
    );
  }
}
