import 'package:actionfigure_app/list_product.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:actionfigure_app/ui/tile_products.dart';
import 'package:actionfigure_app/list_product.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  int? index;
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Center(
            child: Text(
          'Our Product',
          style: purpletextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 32),
        )),
      );
    }

    return ListView.builder(
        itemCount: ListProduct.daftarProduk.length,
        itemBuilder: ((context, index) {
          return TileProducts(
              id: ListProduct.daftarProduk[index].id,
              name: ListProduct.daftarProduk[index].nama,
              image: ListProduct.daftarProduk[index].image,
              price: ListProduct.daftarProduk[index].harga);
      
        }));
  }
}
