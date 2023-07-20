import 'package:isar/isar.dart';

import '../models/bill.dart';

class BillRepository {
  final Isar isar;

  BillRepository(this.isar);

  Future<List<Bill>> getAllBills() async {
    return await isar.bills.where().findAll();
  }

  Future<void> createUpdateBill(Bill bill) async {
    await isar.writeTxn(() async {
      await isar.bills.put(bill);
    });
  }

  Future<void> deleteBill(int billId) async {
    await isar.writeTxn(() async {
      await isar.bills.delete(billId);
    });
  }

  Future<Bill?> getBillById(int billId) async {
    return await isar.bills.get(billId);
  }
}
