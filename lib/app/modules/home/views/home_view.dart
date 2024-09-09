import 'package:flutter/material.dart';
import 'package:my_link_space/app/modules/home/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return Scaffold(
      body: Center(
        child: Text(
          "Count: ${homeController.count}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeController.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
