import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../shared/widgets/qr_scanner.dart';
import '../../categories/providers/category_provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductForm extends HookConsumerWidget {
  final Product? product;
  final String? barCode;
  ProductForm({super.key, this.product, this.barCode});

  final productForm = FormGroup(
    {
      'name': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
      'description': FormControl<String>(
        value: '',
      ),
      'barCode': FormControl<String>(
        value: '',
      ),
      'price': FormControl<double>(
        value: 0.0,
        validators: [Validators.required],
      ),
      'quantity': FormControl<int>(
        value: 0,
        validators: [Validators.required],
      ),
      'categoryId': FormControl<int?>(
        value: null,
        validators: [Validators.required],
      ),
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productRepository = ref.watch(productRepositoryProvider).value;
    final categories = ref.watch(categoriesProvider);
    useEffect(
      () {
        if (product == null && barCode != null) {
          productForm.control('barCode').value = barCode;
          return null;
        }
        if (product == null) return null;
        productForm.control('name').value = product!.name;
        productForm.control('description').value = product!.description;
        productForm.control('price').value = product!.price;
        productForm.control('quantity').value = product!.quantity;
        productForm.control('categoryId').value = product!.categoryId;
        productForm.control('barCode').value = product!.barCode ?? barCode;
        return null;
      },
      [product],
    );

    _submit() async {
      if (!productForm.valid) {
        return;
      }

      if (product == null) {
        final newProduct = Product(
          name: productForm.control('name').value,
          description: productForm.control('description').value,
          price: productForm.control('price').value,
          quantity: productForm.control('quantity').value,
          categoryId: productForm.control('categoryId').value,
          barCode: productForm.control('barCode').value,
        );
        await productRepository!.createUpdateProduct(newProduct);
        ref.refresh(productsProvider);
        Navigator.pop(context);
        return;
      }

      product!.name = productForm.control('name').value;
      product!.description = productForm.control('description').value;
      product!.price = productForm.control('price').value;
      product!.quantity = productForm.control('quantity').value;
      product!.categoryId = productForm.control('categoryId').value;
      product!.barCode = productForm.control('barCode').value;

      await productRepository!.createUpdateProduct(product!);
      ref.refresh(productsProvider);
      Navigator.pop(context);
    }

    return ReactiveForm(
      formGroup: productForm,
      child: AlertDialog(
        scrollable: true,
        title: Text(product == null ? 'Agregar producto' : 'Editar producto'),
        content: SizedBox(
          height: 420,
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
              ReactiveTextField<double>(
                formControlName: 'price',
                decoration: const InputDecoration(
                  labelText: 'Precio',
                ),
              ),
              ReactiveTextField<int>(
                formControlName: 'quantity',
                decoration: const InputDecoration(
                  labelText: 'Cantidad',
                ),
              ),
              ReactiveDropdownField<int?>(
                formControlName: 'categoryId',
                decoration: const InputDecoration(
                  labelText: 'Categoría',
                ),
                items: categories.when(
                  data: (data) {
                    return data.map((category) {
                      return DropdownMenuItem<int>(
                        value: category.id,
                        child: Text(category.name),
                      );
                    }).toList();
                  },
                  loading: () => const [],
                  error: (error, stack) => const [],
                ),
              ),
              const SizedBox(height: 10.0),
              ReactiveValueListenableBuilder(
                formControlName: 'barCode',
                builder: (context, control, child) {
                  return ListTile(
                    leading: const Icon(Icons.qr_code),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    title: Text(
                        control.value as String? ?? 'Agregar código de barras'),
                    onTap: () async {
                      await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return QrScanner(
                            onScan: (result) async {
                              productForm.control('barCode').value = result;
                              Navigator.pop(context);
                            },
                          );
                        },
                      ));
                    },
                  );
                },
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
