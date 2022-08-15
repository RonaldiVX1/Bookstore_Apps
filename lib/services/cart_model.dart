class CartModel {
  final String id;
  final String judul;
  final String image;
  final double harga;
  int quantity;

  CartModel({
    required this.id,
    required this.judul,
    required this.image,
    required this.harga,
    required this.quantity,
  });
}
