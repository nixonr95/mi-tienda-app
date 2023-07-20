import 'package:mi_tienda/src/views/bills/bills.dart';

import '../../products/models/product.dart';

ProductBill productToProductBill(Product product) {
  return ProductBill(
    id: product.id,
    name: product.name,
    description: product.description,
    price: product.price,
    categoryId: product.categoryId,
  );
}

List<ProductBill> productsToProductsBill(List<Product> products) {
  return products.map((product) => productToProductBill(product)).toList();
}
