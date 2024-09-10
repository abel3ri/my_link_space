import 'package:flutter/material.dart';
import 'package:my_link_space/core/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewmodel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: homeViewmodel.increment,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          "Count ${homeViewmodel.count}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
