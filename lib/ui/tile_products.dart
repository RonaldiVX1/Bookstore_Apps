import 'package:actionfigure_app/services/cart_model.dart';
import 'package:actionfigure_app/services/cart_provider.dart';
import 'package:actionfigure_app/services/product_provider.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../detail_product.dart';

class TileProducts extends StatelessWidget {
  var uid = Uuid();
  String id;
  String name;
  String image;
  double price;
  int quantity = 1;

  TileProducts({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailProduct()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultBorder),
        ),
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, top: defaultMargin),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorder),
                image: DecorationImage(
                  image: NetworkImage('$image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '\$ $price',
                      style: blueTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Provider.of<CartProvider>(context, listen: false)
                        //     .addCart(
                        //   CartModel(
                        //     id: uid.v4(),
                        //     judul: name,
                        //     image: image,
                        //     harga: price,
                        //     quantity: quantity,
                        // //   ),
                        // Provider.of<ProductProvider>(context, listen: false)
                        //     .getProduct();
                        // );
                      },
                      child: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: kPurpleColor,
                        size: 25,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
