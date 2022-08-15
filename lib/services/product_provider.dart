import 'dart:convert';

import 'package:actionfigure_app/services/cart_model.dart';
import 'package:actionfigure_app/services/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _productList = [];
  var urlUpdate = 'http://10.0.2.2:8000/api/products/update/';
  var urlDelete = 'http://10.0.2.2:8000/api/products/destroy/';
  List<ProductModel> get productList => _productList;

  Future addProduct(ProductModel product) async {
    try {
      var response =
          await Dio().post('http://10.0.2.2:8000/api/products/store', data: {
        'name': product.name,
        'author': product.author,
        'price': product.price,
        'description': product.description,
        'image': product.image,
      });

      print(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future removeProduct(ProductModel product) async {

     _productList = _productList.where((item) => item.id != product.id).toList();

    try {
      var response = await Dio().post(urlDelete + product.id.toString());

      print(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future updateProduct(ProductModel product) async {
    // _productList[_productList.indexWhere((item) => item.id == product.id)] = product;

    try {
      var response = await Dio().post(urlUpdate + product.id.toString(), data: {
        'name': product.name,
        'author': product.author,
        'price': product.price,
        'description': product.description,
        'image': product.image,
      });

      print(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  void clearData() {
    _productList.clear();
  }

  ProductModel findById(productId) {
    return _productList.firstWhere((prodId) => prodId.id == productId);
  }

  Future getProduct() async {
    try {
      var response = await Dio().get('http://10.0.2.2:8000/api/products');

      List temp = response.data['data'];

      for (var i = 0; i < temp.length; i++) {
        _productList.add(ProductModel(
            id: temp[i]['id'],
            name: temp[i]['name'],
            author: temp[i]['author'],
            price: temp[i]['price'],
            description: temp[i]['description'],
            image: temp[i]['image']));
      }
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}

//fhbWnk&h