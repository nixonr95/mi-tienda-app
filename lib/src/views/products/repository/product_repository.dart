import 'package:isar/isar.dart';
import 'package:mi_tienda/src/views/categories/categories.dart';

import '../products.dart';

class ProductRepository {
  final Isar isar;

  ProductRepository(this.isar);

  Future<List<Product>> getAllProducts() async {
    return await isar.products.where().findAll();
  }

  Future<void> createUpdateProduct(Product product) async {
    final category = await isar.categorys.get(product.categoryId);
    final oldProduct = await isar.products.get(product.id);
    if (category == null) return;

    if (oldProduct != null && oldProduct.categoryId != product.categoryId) {
      final oldCategory = await isar.categorys.get(oldProduct.categoryId);
      if (oldCategory != null) {
        oldCategory.products.remove(oldProduct);
        await isar.writeTxn(() async {
          await oldCategory.products.save();
        });
      }
    }
    category.products.add(product);

    await isar.writeTxn(() async {
      await isar.products.put(product);
      await category.products.save();
    });
  }

  Future<void> deleteProduct(int productId) async {
    await isar.writeTxn(() async {
      await isar.products.delete(productId);
    });
  }
}
