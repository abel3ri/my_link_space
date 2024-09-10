import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  int _count = 0;

  void increment() {
    _count++;
    notifyListeners();
  }

  int get count => _count;
}
