import 'package:actionfigure_app/services/cart_provider.dart';
import 'package:actionfigure_app/ui/cartlist_product.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:actionfigure_app/ui/tile_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_product.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(builder: (context, cartProvider, child) {
        return ListView(
          children: [
            TileProducts(
              id: '5',
              name: 'Sketchbook Challenge : Over ...',
              image:
                  'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2022-01/9781914317040.jpg?itok=a6jvOQqp',
              price: 35,
            ),
            TileProducts(
              id: '5',
              name: 'Fantastic Beasts and Where ...',
              image:
                  'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2019-03/9781408708989.jpg?itok=Jue3P894',
              price: 35,
            )
          ],
        );
      }),
    );
  }
}
