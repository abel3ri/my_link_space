import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_link_space/core/view_models/home_view_model.dart';
import 'package:my_link_space/ui/views/analytics_view.dart';
import 'package:my_link_space/ui/views/appearance_view.dart';
import 'package:my_link_space/ui/views/links_view.dart';
import 'package:my_link_space/ui/views/more_view.dart';
import 'package:my_link_space/ui/views/preview_view.dart';
import 'package:my_link_space/utils/context_extension.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final List<Widget> pages = [
    LinksView(),
    const AppearanceView(),
    const PreviewView(),
    const AnalyticsView(),
    const MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: IndexedStack(
        index: homeViewModel.index,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: homeViewModel.index,
        onTap: homeViewModel.onPageChanged,
        items: [
          BottomNavigationBarItem(
            label: context.localizations.links,
            icon: const FaIcon(FontAwesomeIcons.link),
          ),
          BottomNavigationBarItem(
            label: context.localizations.appearance,
            icon: const FaIcon(FontAwesomeIcons.shapes),
          ),
          BottomNavigationBarItem(
            label: context.localizations.preview,
            icon: const FaIcon(FontAwesomeIcons.eye),
          ),
          BottomNavigationBarItem(
            label: context.localizations.analytics,
            icon: const FaIcon(FontAwesomeIcons.chartSimple),
          ),
          BottomNavigationBarItem(
            label: context.localizations.more,
            icon: const FaIcon(FontAwesomeIcons.circle),
          ),
        ],
      ),
    );
  }
}
