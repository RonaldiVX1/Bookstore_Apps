class ListProduct {
  final String id;
  final String nama;
  final String image;
  final double harga;

  ListProduct({
    required this.id,
    required this.nama,
    required this.image,
    required this.harga,
  });

  static List<ListProduct> daftarProduk = [
    ListProduct(
        id: '1',
        nama: 'PG 1/60 UNICORN GUNDAM ',
        image: 'assets/product1.jpg',
        harga: 700.0),
    ListProduct(
              id: '2',
      nama: 'MG MISSION F90',
      image: 'assets/product2.jpg',
      harga: 500.50,
    ),
    ListProduct(
        id: '3',
        nama: 'PG 1/60 UNICORN GUNDAM',
        image: 'assets/product3.jpg',
        harga: 350.00),
    ListProduct(
              id: '4',
        nama: 'MG 1/100 STRIKE FREEDOM ',
        image: 'assets/product4.jpg',
        harga: 350.00),
    ListProduct(
              id: '5',
        nama: 'GUNDAM 02 BANSHEE NORN',
        image: 'assets/product5.jpg',
        harga: 350.00),
    ListProduct(
              id: '6',
        nama: 'GUNDAM ASTRAY RED FRAME KAI',
        image: 'assets/product6.jpg',
        harga: 350.00),
    ListProduct(
              id: '7',
        nama: 'ZOIDS 1/72 EZ-054 LIGER ZERO X',
        image: 'assets/product7.jpg',
        harga: 350.00),
    ListProduct(
              id: '8',
        nama: 'MG 1/100 GINN GLADIATOR',
        image: 'assets/product8.jpg',
        harga: 350.00),
  ];
}
