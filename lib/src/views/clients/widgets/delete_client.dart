import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/client.dart';
import '../providers/client_provider.dart';

class DeleteClient extends ConsumerWidget {
  final Client client;
  const DeleteClient({super.key, required this.client});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientRepository = ref.watch(clientRepositoryProvider).value;
    return AlertDialog(
      content: SizedBox(
        child: Text(
          '¿Está seguro que desea eliminar el cliente ${client.name}?',
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () async {
            await clientRepository!.deleteClient(client.id);
            ref.refresh(clientsProvider);
            Navigator.pop(context);
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
