import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';

Widget getbuildpage1() => Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Row(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/chair.png',
                          width: 130,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              color: kbutton1),
                          child: Image.asset(
                            'assets/images/layout4.png',
                            width: 100,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 170.0),
                        child: Image.asset(
                          'assets/images/insta_man.png',
                          width: 110,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30, top: 55.0),
                        child: Stack(children: [
                          Positioned(
                            // left: 10,
                            // top: 100,
                            child: Image.asset(
                              'assets/images/shadow.png',
                              width: 230,
                              height: 340,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            // top: 10,
                            bottom: 30,
                            right: 40,
                            child: Image.asset(
                              'assets/images/man.png',
                              width: 230,
                              height: 350,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ]),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Positioned(
              child: Text(
            'Unify your \n    content',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.bold, fontSize: 40, color: kfield_back),
          )),
        ]),
      ),
    );
Widget getbuildpage2() => Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: SizedBox(
                height: 300,
                width: 350,
                child: Stack(
                  children: [
                    Positioned(
                      left: 150,
                      top: 20,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            // color: kbackground2,
                            borderRadius: BorderRadius.circular(0)),
                        child: Image.asset(
                          'assets/images/layout5.png',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 130,
                      top: 50,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            // color: kbackground4,
                            borderRadius: BorderRadius.circular(0)),
                        child: Image.asset(
                          'assets/images/layout4.png',
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 100,
                      top: 80,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0)),
                        child: Image.asset(
                          'assets/images/layout3.png',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 70,
                      top: 110,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0)),
                        child: Image.asset(
                          'assets/images/layout2.png',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 140,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0)),
                        child: Image.asset(
                          'assets/images/layout1.png',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 220,
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: kbackground4,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          'assets/images/layout6.png',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Positioned(
              child: Text(
            'Build your \n    fanbase',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.bold, fontSize: 40, color: kfield_back),
          )),
        ],
      ),
    );
Widget getbuildpage3() => Scaffold(
    backgroundColor: Colors.transparent,
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(70),
          child: Image.asset('assets/images/Auto Layout Vertical.png'),
        ),
        Text(
          'Build your \n  fanbase',
          style: GoogleFonts.inter(
              fontWeight: FontWeight.bold, fontSize: 40, color: kfield_back),
        )
      ],
    ));
