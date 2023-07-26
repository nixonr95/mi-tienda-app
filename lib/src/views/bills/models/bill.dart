import 'package:isar/isar.dart';
import 'package:meta/meta.dart';

part 'bill.g.dart';

@immutable
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
    this.isPaid = false,
    this.canBeEdited = true,
    this.paymentDate,
    this.editedDate,
    this.total = 0,
  });

  Bill copyWith({
    String? description,
    int? clientId,
    String? clientDocument,
    String? clientName,
    double? total,
    bool? isPaid,
    bool? canBeEdited,
    DateTime? paymentDate,
    DateTime? editedDate,
    List<ProductBill>? products,
  }) {
    return Bill(
      description: description ?? this.description,
      clientId: clientId ?? this.clientId,
      clientDocument: clientDocument ?? this.clientDocument,
      clientName: clientName ?? this.clientName,
      total: total ?? this.total,
      isPaid: isPaid ?? this.isPaid,
      canBeEdited: canBeEdited ?? this.canBeEdited,
      paymentDate: paymentDate ?? this.paymentDate,
      editedDate: editedDate ?? this.editedDate,
      products: products ?? this.products,
    );
  }
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
