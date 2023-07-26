import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/shared.dart';
import '../../clients/models/client.dart';
import '../../clients/providers/client_provider.dart';
import '../../products/products.dart';
import '../forms/client_bill_form.dart';
import '../models/bill.dart';
import '../providers/bill_provider.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class BillFormScreen extends HookConsumerWidget {
  const BillFormScreen({super.key});
  static const routeName = 'bills_form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bill = useState(ModalRoute.of(context)!.settings.arguments as Bill?);
    final billRepository = ref.watch(billRepositoryProvider).value;
    final clients = ref.watch(clientsProvider);

    onSelectClient(Client client) {
      if (bill.value == null) {
        bill.value = Bill(
            clientId: client.id,
            clientName: client.name,
            clientDocument: client.document,
            products: const [],
            description: '');
        return;
      }
      bill.value!.clientId = client.id;
      bill.value!.clientName = client.name;
      bill.value!.clientDocument = client.document;
    }

    onSelectProducts(List<Product> products) {
      if (bill.value == null) return;
      // bill.value!.products = [
      //   ...bill.value!.products,
      //   ...productsToProductsBill(products)
      // ];
      bill.value = bill.value!.copyWith(products: [
        ...bill.value!.products,
        ...productsToProductsBill(products)
      ]);
    }

    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ClientBillForm(bill: bill.value, onSelectClient: onSelectClient),
            const SizedBox(height: 20.0),
            if (bill.value != null && bill.value?.clientId != null)
              AddProductBill(onSelectProducts: onSelectProducts),
            const SizedBox(height: 20.0),
            if (bill.value != null) ProductListBill(bill: bill),
          ],
        ),
      ),
    );
  }
}
