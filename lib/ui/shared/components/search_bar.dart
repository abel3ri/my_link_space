import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

List list = [
  "Flutter",
  "React",
  "Ionic",
  "Xamarin",
];

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return GFSearchBar(
      searchList: list,
      searchQueryBuilder: (query, list) {
        return list
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      overlaySearchListItemBuilder: (item) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            item,
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      onItemSelected: (item) {
        setState(() {
          print('$item');
        });
      },
    );
  }
}
