import 'package:flutter/material.dart';

class CardCheckOut extends StatelessWidget {
  String image;
  String title;
  double price;

  CardCheckOut({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: double.infinity,
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage('$image'),
            height: 100,
            width: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$ $price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 210,
                  ),
                  Icon(Icons.remove),
                  Icon(Icons.add),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CardCheckOutDiscount extends StatelessWidget {
  String image;
  String title;
  double discount;
  double price;

  CardCheckOutDiscount({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: double.infinity,
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage('$image'),
            height: 100,
            width: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '\$ $discount',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 210,
                  ),
                  Icon(Icons.remove),
                  Icon(Icons.add),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
