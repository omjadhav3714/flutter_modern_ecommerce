class Product {
  String name;
  int price;
  int qty = 1;
  int quantity;
  List imageUrls;
  String productId;
  String sellerId;

  Product({
    required this.name,
    required this.price,
    required this.qty,
    required this.quantity,
    required this.imageUrls,
    required this.productId,
    required this.sellerId,
  });

  void increase() {
    qty++;
  }

  void decrease() {
    qty--;
  }
}
