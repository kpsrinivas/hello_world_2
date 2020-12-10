import 'package:flutter/material.dart';

class CartViewModel with ChangeNotifier {
  Set _cartItemId = Set();
  void addToCart(int id) {
    _cartItemId.add(id);
    notifyListeners();
  }

  void removeFromCart(int id) {
    _cartItemId.remove(id);
    notifyListeners();
  }

  bool checkCartItem(int id) {
    return _cartItemId.contains(id);
  }

  int get getCartLength {
    return _cartItemId.length;
  }
}
