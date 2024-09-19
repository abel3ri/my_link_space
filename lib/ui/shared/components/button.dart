import 'package:flutter/material.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:my_link_space/ui/shared/components/icon_pack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MAterialBtn extends StatefulWidget {
  MAterialBtn(
      {super.key,
      required this.width,
      required this.onTap,
      required this.ttile,
      required this.height,
      required this.colors});
  VoidCallback onTap;
  final double width;
  final String ttile;
  final double height;
  final Color colors;

  @override
  State<MAterialBtn> createState() => _MAterialBtnState();
}

class _MAterialBtnState extends State<MAterialBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.2)),
          color: kbutton_finall1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 5),
            Text(
              widget.ttile,
              style: CustomTextStyles.B1,
            ),
          ],
        ),
      ),
    );
  }
}

class Material2Btn extends StatefulWidget {
  Material2Btn({
    super.key,
    required this.text,
    required this.images,
    required this.onTap,
  });
  final String text;
  final String images;
  VoidCallback onTap;

  @override
  State<Material2Btn> createState() => _Material2BtnState();
}

class _Material2BtnState extends State<Material2Btn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 370,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30.2)),
          color: kfield_back,
          border:
              Border.all(color: kOnSecondaryColor, style: BorderStyle.solid),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 50, width: 50, child: Image.asset(widget.images)),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.text,
              style: CustomTextStyles.D2,
            ),
          ],
        ),
      ),
    );
  }
}
