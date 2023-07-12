import 'package:isar/isar.dart';

part 'client.g.dart';

@collection
class Client {
  Id id = Isar.autoIncrement;
  late String name;
  late String document;
  late String address;

  Client({required this.name, required this.document, required this.address});
}
