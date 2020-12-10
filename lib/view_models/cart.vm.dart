import 'package:flutter/material.dart';

class CartViewModel with ChangeNotifier {
  Set _cartItemId = Set();
  int triggerId;
  void addToCart(int id) {
    _cartItemId.add(id);
    this.triggerId = id;
    notifyListeners();
  }

  void removeFromCart(int id) {
    _cartItemId.remove(id);
    this.triggerId = id;
    notifyListeners();
  }

  bool checkCartItem(int id) {
    return _cartItemId.contains(id);
  }

  int get getCartLength {
    return _cartItemId.length;
  }
}
