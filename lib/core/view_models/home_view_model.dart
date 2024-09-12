import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  int _index = 0;

  void onPageChanged(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
}
