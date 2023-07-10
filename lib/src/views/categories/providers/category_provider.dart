import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/providers/isar_provider.dart';
import '../models/category.dart';
import '../repository/category_repository.dart';

part 'category_provider.g.dart';

@riverpod
Future<CategoryRepository> categoryRepository(CategoryRepositoryRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return CategoryRepository(isar);
}

@riverpod
Future<List<Category>> categories(CategoriesRef ref) async {
  final categoryRepository = await ref.watch(categoryRepositoryProvider.future);
  return categoryRepository.getAllCategories();
}
