import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/client.dart';
import '../providers/client_provider.dart';

class ClientSelector extends HookConsumerWidget {
  final Function(Client) onSelect;
  const ClientSelector({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientsProvider);
    return AlertDialog(
      title: const Text('Selecciona un cliente'),
      content: SizedBox(
        height: 300,
        child: clients.when(
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20.0),
                  ...data.map((e) {
                    return InkWell(
                      onTap: () {
                        onSelect(e);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Text('Nombre: ${e.name}'),
                        subtitle: Text('Documento: ${e.document}'),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
          error: (error, stackTrace) => const Center(child: Text('Error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
