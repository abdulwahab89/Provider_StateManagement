import 'package:flutter/material.dart';

class MultiProviderExample with ChangeNotifier {
  double _value = 1.0;
  double get value => _value;
  setValue(val) {
    _value = val;
    notifyListeners();
  }
}
