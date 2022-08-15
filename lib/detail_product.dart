import 'package:actionfigure_app/services/product_model.dart';
import 'package:actionfigure_app/services/product_provider.dart';
import 'package:actionfigure_app/succes_order.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatelessWidget {
  final ProductModel? product;

  DetailProduct({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (product != null) {
      String name = product!.name;
      String author = product!.author;
      String price = product!.price;
      String image = product!.image;
    }

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: Image(
                  image: NetworkImage(
                    product?.image ??
                        'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2020-03/9784046024381.jpg?itok=eL-Q1RHW',
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 345),
                    padding: EdgeInsets.all(defaultMargin),
                    width: double.infinity,
                    height: 510,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultBorder),
                      color: kPurpleColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 350),
                      padding: EdgeInsets.all(defaultMargin),
                      width: 405,
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultBorder),
                        color: kWhiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product?.name ?? 'name',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            product?.author ?? 'Master Grade',
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kBlueColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Price',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$',
                                        style: purpletextStyle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        product?.price ?? '250.55',
                                        style: purpletextStyle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Description',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            product?.description ??
                                'Dengeki Hobby, Hobby Japan and Premium Bandai are collaborating to celebrate the 10th anniversary of Mobile Suit Gundam AGE by releasing a set of Gundam AGE-1 Razor & Gundam AGE-2 Artimes.',
                            style: greyTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 7,
                            overflow: TextOverflow.clip,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessOrder()),
                              );
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kPurpleColor,
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Buy Now',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
