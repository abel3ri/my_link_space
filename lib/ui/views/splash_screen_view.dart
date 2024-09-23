import 'package:flutter/material.dart';
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
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -0.2),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceInOut,
      ),
    );

    controller.repeat(reverse: true);
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
      backgroundColor: kbackground1,
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.repeat(reverse: true);
          },
          child: SlideTransition(
            position: animation,
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
