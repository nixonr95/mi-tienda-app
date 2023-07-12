import 'package:flutter/material.dart';

import '../forms/client_form.dart';
import '../models/client.dart';
import 'delete_client.dart';

class ClientCard extends StatelessWidget {
  final Client client;
  const ClientCard({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    final primayColor = Theme.of(context).primaryColor;
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                client.name,
                style: const TextStyle(fontSize: 20.0),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: primayColor),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ClientForm(client: client),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => DeleteClient(client: client),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          Text(
            'Documento: ${client.document}',
            style: const TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
