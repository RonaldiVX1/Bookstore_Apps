import 'package:actionfigure_app/detail_product.dart';
import 'package:actionfigure_app/services/product_model.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoxProducts extends StatelessWidget {
  ProductModel produk;

  BoxProducts({
    Key? key,
    required this.produk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailProduct(
                    product: produk,
                  )),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorder),
          color: kWhiteColor,
        ),
        height: 250,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorder),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(produk.image),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    produk.name,
                    maxLines: 2,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$ ',
                        style: blueTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        produk.price,
                        style: blueTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
