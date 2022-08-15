import 'dart:math';
import 'package:actionfigure_app/services/product_model.dart';
import 'package:actionfigure_app/services/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class addEditWidget extends StatelessWidget {
  final String tittle;
  final ProductModel? product;
  int randomId = Random().nextInt(1000);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  addEditWidget({
    Key? key,
    required this.tittle,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (product != null) {
      nameController.text = product!.name;
      authorController.text = product!.author;
      priceController.text = product!.price;
      descriptionController.text = product!.description;
      imageController.text = product!.image;
    }

    return AlertDialog(
      title: Text(tittle),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text('Nama Barang'),
            TextField(controller: nameController),
            SizedBox(height: 20),
            Text('Author'),
            TextField(controller: authorController),
            SizedBox(height: 20),
            Text('Harga'),
            TextField(controller: priceController),
            SizedBox(height: 20),
            Text('Deskripsi Product'),
            TextField(controller: descriptionController),
            SizedBox(height: 20),
            Text('Gambar'),
            TextField(controller: imageController),
            SizedBox(height: 20),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Provider.of<ProductProvider>(context, listen: false).addProduct(
                ProductModel(
                    id: 5,
                    name: nameController.text,
                    author: authorController.text,
                    price: priceController.text,
                    description: descriptionController.text,
                    image: imageController.text));

            Navigator.pop(context);
          },
          child: Text('tambahkan'),
        ),
      ],
    );
  }
}
