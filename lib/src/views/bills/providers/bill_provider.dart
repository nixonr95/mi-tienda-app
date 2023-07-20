import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/providers/isar_provider.dart';
import '../models/bill.dart';
import '../repository/bill_repository.dart';

part 'bill_provider.g.dart';

@riverpod
Future<BillRepository> billRepository(BillRepositoryRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return BillRepository(isar);
}

@riverpod
Future<List<Bill>> bills(BillsRef ref) async {
  final billRepository = await ref.watch(billRepositoryProvider.future);
  return billRepository.getAllBills();
}
