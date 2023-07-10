import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/category.dart';
import '../providers/category_provider.dart';

class CategoryForm extends HookConsumerWidget {
  final Category? category;
  CategoryForm({super.key, this.category});

  final categoryForm = FormGroup(
    {
      'name': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
      'description': FormControl<String>(
        value: '',
      ),
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryRepository = ref.watch(categoryRepositoryProvider).value;
    useEffect(
      () {
        if (category == null) return null;
        categoryForm.control('name').value = category!.name;
        categoryForm.control('description').value = category!.description;
        return null;
      },
      [category],
    );

    _submit() async {
      if (!categoryForm.valid) {
        return;
      }

      if (category == null) {
        final newCategory = Category(
          name: categoryForm.control('name').value,
          description: categoryForm.control('description').value,
        );
        await categoryRepository!.createUpdateCategory(newCategory);
        ref.refresh(categoriesProvider);
        Navigator.pop(context);
        return;
      }

      category!.name = categoryForm.control('name').value;
      category!.description = categoryForm.control('description').value;

      await categoryRepository!.createUpdateCategory(category!);
      ref.refresh(categoriesProvider);
      Navigator.pop(context);
    }

    return ReactiveForm(
      formGroup: categoryForm,
      child: AlertDialog(
        title:
            Text(category == null ? 'Agregar categoría' : 'Editar categoría'),
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
                formControlName: 'description',
                decoration: const InputDecoration(
                  labelText: 'Descripción',
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
