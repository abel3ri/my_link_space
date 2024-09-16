import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/core/view_models/home_view_model.dart';
import 'package:my_link_space/ui/views/analytics_view.dart';
import 'package:my_link_space/ui/views/appearance_view.dart';
import 'package:my_link_space/ui/views/links_view.dart';
import 'package:my_link_space/ui/views/more_view.dart';
import 'package:my_link_space/ui/views/preview_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final List<Widget> pages = [
    LinksView(),
    AppearanceView(),
    PreviewView(),
    AnalyticsView(),
    MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: IndexedStack(
        children: pages,
        index: homeViewModel.index,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: homeViewModel.index,
        onTap: homeViewModel.onPageChanged,
        items: [
          BottomNavigationBarItem(
            label: "Links",
            icon: FaIcon(FontAwesomeIcons.link),
          ),
          BottomNavigationBarItem(
            label: "Appearance",
            icon: FaIcon(FontAwesomeIcons.shapes),
          ),
          BottomNavigationBarItem(
            label: "Preview",
            icon: FaIcon(FontAwesomeIcons.eye),
          ),
          BottomNavigationBarItem(
            label: "Analytics",
            icon: FaIcon(FontAwesomeIcons.chartSimple),
          ),
          BottomNavigationBarItem(
            label: "More",
            icon: FaIcon(FontAwesomeIcons.circle),
          ),
        ],
      ),
    );
  }
}
