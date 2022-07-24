import 'package:flutter/widgets.dart';
import 'package:modern_ecommerce/models/product_model.dart';

class Cart extends ChangeNotifier {
  final List<Product> _list = [];
  List<Product> get getItems {
    return _list;
  }

  int? get count {
    return _list.length;
  }

  void addItem(
    String name,
    int price,
    int qty,
    int quantity,
    List imageUrls,
    String productId,
    String sellerId,
  ) {
    final product = Product(
      name: name,
      price: price,
      qty: qty,
      quantity: quantity,
      imageUrls: imageUrls,
      productId: productId,
      sellerId: sellerId,
    );
    _list.add(product);
    notifyListeners();
  }

  void increment(Product product) {
    product.increase();
    notifyListeners();
  }

  void decrement(Product product) {
    product.decrease();
    notifyListeners();
  }
}
