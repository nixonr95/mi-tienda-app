import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement;
  late String name;
  late String description;
  late String? barCode;
  late double price;
  late int quantity;
  late int categoryId;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.categoryId,
    this.barCode,
  });
}
