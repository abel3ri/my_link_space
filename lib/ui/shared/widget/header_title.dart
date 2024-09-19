import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: Column(children: [
        Text(
          'MyLinkSpace',
          style: CustomTextStyles.title1,
        ),
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset(
          'assets/images/token_spaces.svg',
          width: 80,
          height: 80,
          color: kfield_back,
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Join MyLinkSpace',
            style: CustomTextStyles.D1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    ));
  }
}
