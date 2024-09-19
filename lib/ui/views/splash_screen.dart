import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.repeat();
    Future.delayed(const Duration(seconds: 5), () {
      context.go('/register');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kbackground1,
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.repeat();
          },
          child: GFAnimation(
            turnsAnimation: animation,
            controller: controller,
            type: GFAnimationType.rotateTransition,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/token_spaces.svg',
              width: 80,
              height: 80,
              color: kfield_back,
            ),
          ),
        ),
      ),
    );
  }
}
