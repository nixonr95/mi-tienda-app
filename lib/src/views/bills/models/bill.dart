import 'package:isar/isar.dart';

part 'bill.g.dart';

@collection
class Bill {
  Id id = Isar.autoIncrement;
  final DateTime date = DateTime.now();
  late String description;
  late int clientId;
  late String clientDocument;
  late String clientName;
  late double total;
  late bool isPaid = false;
  late bool canBeEdited = true;
  late DateTime? paymentDate;
  late DateTime? editedDate;
  late List<ProductBill> products;

  Bill({
    required this.description,
    required this.clientId,
    required this.clientDocument,
    required this.clientName,
    required this.products,
    this.total = 0,
  });
}

@embedded
class ProductBill {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final int? categoryId;

  ProductBill({
    this.id,
    this.name,
    this.description,
    this.price,
    this.categoryId,
  });
}
