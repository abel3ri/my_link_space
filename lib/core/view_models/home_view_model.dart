import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
<<<<<<< HEAD:lib/core/view_model/home_view_model.dart
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
=======
  int _index = 0;

  void onPageChanged(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
>>>>>>> 740afc0a62e474dfa3deb37e18b2cb454b51e102:lib/core/view_models/home_view_model.dart
}
