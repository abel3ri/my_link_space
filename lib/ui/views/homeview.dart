import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homeview extends StatefulWidget {
  final Widget child;

  const Homeview({super.key, required this.child});
  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
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
      body: Stack(
        children: [
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
                          context.go('/link');
                        }),
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
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
