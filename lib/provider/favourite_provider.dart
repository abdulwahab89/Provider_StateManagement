import 'package:flutter/material.dart';

class FavProvider with ChangeNotifier {
  List<int> _selectedItems = [];
  List<int> get selectedItem => _selectedItems;
  void addItem(int value) {
    _selectedItems.add(value);
    notifyListeners();
  }

  void remove(int value) {
    _selectedItems.remove(value);
    notifyListeners();
  }
}
