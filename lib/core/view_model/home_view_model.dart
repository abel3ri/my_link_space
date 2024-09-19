import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  void updatePage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
  }
}
