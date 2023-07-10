import 'package:isar/isar.dart';

import '../../products/products.dart';

part 'category.g.dart';

@collection
class Category {
  Id id = Isar.autoIncrement;
  late String name;
  late String description;
  final IsarLinks<Product> products = IsarLinks<Product>();

  Category({required this.name, required this.description});
}
