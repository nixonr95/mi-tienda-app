import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/providers/isar_provider.dart';
import '../products.dart';
import '../repository/product_repository.dart';

part 'product_provider.g.dart';

@riverpod
Future<ProductRepository> productRepository(ProductRepositoryRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return ProductRepository(isar);
}

@riverpod
Future<List<Product>> products(ProductsRef ref) async {
  final categoryRepository = await ref.watch(productRepositoryProvider.future);
  return categoryRepository.getAllProducts();
}
