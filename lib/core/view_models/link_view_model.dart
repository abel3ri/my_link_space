import 'package:flutter/material.dart';

class LinkViewModel with ChangeNotifier {
  List<Widget> _items = [
    Text("Ototo"),
    Text("Title"),
    Text(
      "Discover Ethiopian and International Mobile App Developers",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
  ];
  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    notifyListeners();
  }

  List<Widget> get items => _items;
}
