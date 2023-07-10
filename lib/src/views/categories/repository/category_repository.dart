import 'package:isar/isar.dart';

import '../categories.dart';

class CategoryRepository {
  final Isar isar;

  CategoryRepository(this.isar);

  Future<List<Category>> getAllCategories() async {
    return await isar.categorys.where().findAll();
  }

  Future<void> createUpdateCategory(Category category) async {
    await isar.writeTxn(() async {
      await isar.categorys.put(category);
    });
  }

  Future<void> deleteCategory(int categoryId) async {
    await isar.writeTxn(() async {
      await isar.categorys.delete(categoryId);
    });
  }

  Future<Category?> getCategoryById(int categoryId) async {
    return await isar.categorys.get(categoryId);
  }
}
