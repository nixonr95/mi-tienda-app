import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../clients/models/client.dart';
import '../../clients/widgets/client_selector.dart';
import '../bills.dart';

class ClientBillForm extends HookWidget {
  final Bill? bill;
  final Function(Client) onSelectClient;
  const ClientBillForm({super.key, this.bill, required this.onSelectClient});

  @override
  Widget build(BuildContext context) {
    final cliente = useState<Client?>(null);

    onChangeClient(Client client) {
      cliente.value = client;
      onSelectClient(client);
    }

    return Column(
      children: [
        bill != null || cliente.value != null
            ? ListTile(
                tileColor: Colors.grey[100],
                titleAlignment: ListTileTitleAlignment.center,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                title: Text(
                    bill != null ? bill!.clientName : cliente.value!.name,
                    textAlign: TextAlign.center),
                subtitle: Text(
                    bill != null
                        ? bill!.clientDocument
                        : cliente.value!.document,
                    textAlign: TextAlign.center),
                // trailing: IconButton(
                //   icon: const Icon(Icons.edit),
                //   onPressed: () {},
                // ),
              )
            : ListTile(
                tileColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                title: const Text('Seleccionar cliente'),
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          ClientSelector(onSelect: onChangeClient),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
