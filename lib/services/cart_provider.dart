import 'package:actionfigure_app/services/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cartList = [];

  List<CartModel> get cartList => _cartList;

  void addCart(CartModel cart) {
    _cartList.add(cart);
    notifyListeners();
  }

  void removeCart(CartModel cart) {
    _cartList = _cartList.where((item) => item.id != cart.id).toList();
    notifyListeners();
  }

  void updateCart(CartModel cart) {
    _cartList[_cartList.indexWhere((item) => item.id == cart.id)];
    cart.quantity++;
    notifyListeners();
  }

  void minusCart(CartModel cart) {
    _cartList[_cartList.indexWhere((item) => item.id == cart.id)];
    cart.quantity--;
    if (cart.quantity == 0) {
      removeCart(cart);
    }
    notifyListeners();
  }
}
