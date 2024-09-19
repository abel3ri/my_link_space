import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/views/homeview.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  setBottomBarIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<String> routes = ['/link', '/link', '/link', '/link'];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white.withAlpha(55),
        body: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromARGB(156, 9, 8, 11),
                      child: const Icon(FontAwesomeIcons.eye),
                      elevation: 0.1,
                      onPressed: () {
                        context.go('/link'); // Ensure GoRouter is setup
                      },
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.link,
                            color: currentIndex == 0
                                ? kbutton_finall1
                                : Colors.grey.shade400,
                          ),
                          onPressed: () => setBottomBarIndex(0),
                          splashColor: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.opencart,
                            color: currentIndex == 1
                                ? kbutton_finall1
                                : Colors.grey.shade400,
                          ),
                          onPressed: () => setBottomBarIndex(1),
                        ),
                        Container(
                          width: size.width * 0.20, // Space for the FAB
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.stairs,
                            color: currentIndex == 2
                                ? kbutton_finall1
                                : Colors.grey.shade400,
                          ),
                          onPressed: () => setBottomBarIndex(2),
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.user,
                            color: currentIndex == 3
                                ? kbutton_finall1
                                : Colors.grey.shade400,
                          ),
                          onPressed: () => setBottomBarIndex(3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
