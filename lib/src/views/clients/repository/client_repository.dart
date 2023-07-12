import 'package:isar/isar.dart';

import '../models/client.dart';

class ClientRepository {
  final Isar isar;

  ClientRepository(this.isar);

  Future<List<Client>> getAllClients() async {
    return await isar.clients.where().findAll();
  }

  Future<void> createUpdateClient(Client client) async {
    await isar.writeTxn(() async {
      await isar.clients.put(client);
    });
  }

  Future<void> deleteClient(int clientId) async {
    await isar.writeTxn(() async {
      await isar.clients.delete(clientId);
    });
  }

  Future<Client?> getClientById(int clientId) async {
    return await isar.clients.get(clientId);
  }
}
