import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/client_provider.dart';
import 'client_card.dart';

class ClientsList extends ConsumerWidget {
  const ClientsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientsProvider);
    return clients.when(
        data: (data) {
          return Column(
            children: [
              const Text(
                'Clientes',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              if (data.isEmpty) const Text('No hay clientes'),
              ...data.map((cliente) {
                return Column(
                  children: [
                    ClientCard(client: cliente),
                    const SizedBox(height: 20.0),
                  ],
                );
              }),
            ],
          );
        },
        error: (error, stackTrace) => const Center(child: Text('Error')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
