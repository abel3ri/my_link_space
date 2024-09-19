import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_link_space/core/view_model/home_view_model.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/widget/page_view.dart';
import 'package:provider/provider.dart';

class RegisterNav extends StatefulWidget {
  const RegisterNav({super.key});

  @override
  State<RegisterNav> createState() => _RegisterNavState();
}

class _RegisterNavState extends State<RegisterNav> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      backgroundColor: homeViewModel.pageController.hasClients
          ? getbackcolor(homeViewModel.pageController.page?.round() ?? 0)
          : kbackground1,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: SizedBox(
              height: 40,
              child: SvgPicture.asset(
                'assets/images/token_spaces.svg',
                width: 80,
                height: 80,
                color: kfield_back,
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: homeViewModel.pageController,
              onPageChanged: (int index) {
                homeViewModel.updatePage(index);
              },
              children: [getbuildpage1(), getbuildpage2(), getbuildpage3()],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () => homeViewModel.updatePage(index),
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 6,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: homeViewModel.pageController.hasClients &&
                                homeViewModel.pageController.page?.round() ==
                                    index
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: GFButton(
                  shape: GFButtonShape.pills,
                  color: homeViewModel.pageController.hasClients
                      ? getbtncolor(
                          homeViewModel.pageController.page?.round() ?? 0)
                      : kbutton1,
                  fullWidthButton: true,
                  highlightColor: const Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    context.go('/signup');
                  },
                  text: "Sign Up",
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  context.go('/login');
                },
                child: const Text(
                  "Log in",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color getbtncolor(int pageindex) {
    switch (pageindex) {
      case 0:
        return kbutton1;
      case 1:
        return kbutton2;
      case 2:
        return kbutton3;
      default:
        return kbutton1;
    }
  }

  Color getbackcolor(int pageindex) {
    switch (pageindex) {
      case 1:
        return kbackground2;
      case 2:
        return kbackground3;
      case 3:
        return kbackground3;
      default:
        return Colors.black;
    }
  }
}
