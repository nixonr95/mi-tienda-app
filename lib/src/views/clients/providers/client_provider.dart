import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/providers/isar_provider.dart';
import '../models/client.dart';
import '../repository/client_repository.dart';

part 'client_provider.g.dart';

@riverpod
Future<ClientRepository> clientRepository(ClientRepositoryRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return ClientRepository(isar);
}

@riverpod
Future<List<Client>> clients(ClientsRef ref) async {
  final clientRepository = await ref.watch(clientRepositoryProvider.future);
  return clientRepository.getAllClients();
}
