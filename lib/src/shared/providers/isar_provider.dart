import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../views/bills/bills.dart';
import '../../views/categories/categories.dart';
import '../../views/clients/models/client.dart';
import '../../views/products/products.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarInstance(FutureProviderRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [
      ProductSchema,
      CategorySchema,
      ClientSchema,
      BillSchema,
    ],
    directory: dir.path,
  );
}
