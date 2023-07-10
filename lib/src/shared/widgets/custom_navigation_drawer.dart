import 'package:flutter/material.dart';

import '../../views/categories/screens/categories_screen.dart';
import '../../views/home/home.dart';
import '../../views/products/products.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Mi tienda'),
            ),
          ),
          ListTile(
            tileColor: route == HomeScreen.routeName
                ? Colors.blue.shade50
                : Colors.transparent,
            title: Text('Home',
                style: TextStyle(
                    color: route == HomeScreen.routeName
                        ? Colors.blue
                        : Colors.black)),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            tileColor: route == ProductsScreen.routeName
                ? Colors.blue.shade50
                : Colors.transparent,
            title: Text('Productos',
                style: TextStyle(
                    color: route == ProductsScreen.routeName
                        ? Colors.blue
                        : Colors.black)),
            onTap: () {
              Navigator.pushReplacementNamed(context, ProductsScreen.routeName);
            },
          ),
          ListTile(
            tileColor: route == CategoriesScreen.routeName
                ? Colors.blue.shade50
                : Colors.transparent,
            title: Text('Categorías',
                style: TextStyle(
                    color: route == CategoriesScreen.routeName
                        ? Colors.blue
                        : Colors.black)),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, CategoriesScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
