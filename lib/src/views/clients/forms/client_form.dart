import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/client.dart';
import '../providers/client_provider.dart';

class ClientForm extends HookConsumerWidget {
  final Client? client;
  ClientForm({super.key, this.client});

  final clientForm = FormGroup(
    {
      'name': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
      'document': FormControl<String>(
        value: '',
      ),
      'address': FormControl<String>(
        value: '',
      ),
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientRepository = ref.watch(clientRepositoryProvider).value;
    useEffect(
      () {
        if (client == null) return null;
        clientForm.control('name').value = client!.name;
        clientForm.control('document').value = client!.document;
        clientForm.control('address').value = client!.address;
        return null;
      },
      [client],
    );

    _submit() async {
      if (!clientForm.valid) {
        return;
      }

      if (client == null) {
        final newClient = Client(
          name: clientForm.control('name').value,
          document: clientForm.control('document').value,
          address: clientForm.control('address').value,
        );
        await clientRepository!.createUpdateClient(newClient);
        ref.refresh(clientsProvider);
        Navigator.pop(context);
        return;
      }

      client!.name = clientForm.control('name').value;
      client!.document = clientForm.control('document').value;
      client!.address = clientForm.control('address').value;

      await clientRepository!.createUpdateClient(client!);
      ref.refresh(clientsProvider);
      Navigator.pop(context);
    }

    return ReactiveForm(
      formGroup: clientForm,
      child: AlertDialog(
        title: Text(client == null ? 'Agregar cliente' : 'Editar cliente'),
        content: SizedBox(
          height: 300,
          child: Column(
            children: [
              ReactiveTextField<String>(
                formControlName: 'name',
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
              ),
              ReactiveTextField<String>(
                formControlName: 'document',
                decoration: const InputDecoration(
                  labelText: 'Documento',
                ),
              ),
              ReactiveTextField<String>(
                formControlName: 'address',
                decoration: const InputDecoration(
                  labelText: 'Dirección',
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          ReactiveFormConsumer(builder: (context, form, child) {
            return ElevatedButton(
              onPressed: form.valid ? _submit : null,
              child: const Text('Guardar'),
            );
          }),
        ],
      ),
    );
  }
}
