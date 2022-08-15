import 'dart:math';

import 'package:actionfigure_app/EditProduct.dart';
import 'package:actionfigure_app/addEditProduct.dart';
import 'package:actionfigure_app/detail_product.dart';
import 'package:actionfigure_app/services/product_model.dart';
import 'package:actionfigure_app/services/product_provider.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:actionfigure_app/ui/tile_product_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductApiPage extends StatelessWidget {
  int randomId = Random().nextInt(1000);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  ProductApiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).clearData();
    Provider.of<ProductProvider>(context, listen: false).getProduct();

    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: ((context, productList, child) {
          return ListView(
              children: productList.productList.isNotEmpty
                  ? productList.productList.map((product) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailProduct(
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(defaultBorder),
                          ),
                          margin: EdgeInsets.only(
                              left: defaultMargin,
                              right: defaultMargin,
                              top: defaultMargin),
                          height: 100,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(defaultBorder),
                                  image: DecorationImage(
                                    image: NetworkImage(product.image),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      product.author,
                                      overflow: TextOverflow.ellipsis,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text('\$ '),
                                            Text(
                                              product.price,
                                              style: blueTextStyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 120,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList()
                  : [
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 200),
                          child: Center(
                            child: Container(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                strokeWidth: 15,
                                backgroundColor: kPurpleColor,
                              ),
                            ),
                          ))
                    ]);
        }),
      ),
    );
  }
}
