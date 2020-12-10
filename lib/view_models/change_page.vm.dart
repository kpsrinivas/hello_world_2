import 'package:flutter/material.dart';

class ChangePageViewModel extends ChangeNotifier {
  int index;
  int selectedPage = 0;

  void goToPageTwo(int selectedItemId) {
    this.index = selectedItemId;
    this.selectedPage = 1;
    notifyListeners();
  }

  void goToPageOne() {
    this.selectedPage = 0;
    notifyListeners();
  }
}
