import 'package:actionfigure_app/services/cart_model.dart';
import 'package:actionfigure_app/services/cart_provider.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../detail_product.dart';

class CartListProduct extends StatefulWidget {
  String name;
  String image;
  double price;
  int quantity;

  CartListProduct({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  State<CartListProduct> createState() => _CartListProductState();
}

class _CartListProductState extends State<CartListProduct> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DetailProduct()),
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
                  image: AssetImage('${widget.image}'),
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
                  '${widget.name}',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '\$ ${widget.price}',
                      style: blueTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kRedColor),
                        child: Icon(
                          Icons.remove_circle_outline,
                          size: 20,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.quantity--;
                          if (widget.quantity <= 1) {
                            widget.quantity = 1;
                          }
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kRedColor),
                        child: Icon(
                          Icons.remove_circle_outline,
                          size: 20,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${widget.quantity}',
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.quantity++;
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kBlueColor),
                        child: Icon(
                          Icons.add_circle_outline_rounded,
                          size: 20,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
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
