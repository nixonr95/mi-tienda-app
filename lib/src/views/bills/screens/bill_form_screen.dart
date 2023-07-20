import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/shared.dart';
import '../../clients/models/client.dart';
import '../../clients/providers/client_provider.dart';
import '../forms/client_bill_form.dart';
import '../models/bill.dart';
import '../providers/bill_provider.dart';

class BillFormScreen extends HookConsumerWidget {
  const BillFormScreen({super.key});
  static const routeName = 'bills_form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bill = ModalRoute.of(context)!.settings.arguments as Bill?;
    final billRepository = ref.watch(billRepositoryProvider).value;
    final clients = ref.watch(clientsProvider);

    onSelectClient(Client client) {}

    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('Guardar'),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ClientBillForm(bill: bill, onSelectClient: onSelectClient),
          ],
        ),
      ),
    );
  }
}
