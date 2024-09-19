import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late OverlayEntry overlayEntry;
  Intro intro = Intro(
    padding: const EdgeInsets.all(8),
    borderRadius: const BorderRadius.all(Radius.circular(4)),
    maskColor: const Color.fromRGBO(0, 0, 0, .6),
    noAnimation: false,
    maskClosable: false,
    child: const AboutDialog(),
    buttonBuilder: (order) {
      return IntroButtonConfig(
        text: order == 3 ? 'Custom Button Text' : 'Next',
        height: order == 3 ? 48 : null,
        fontSize: order == 3 ? 24 : null,
        style: order == 3
            ? OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
              )
            : null,
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Intro Screen with Overlay')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                /// Create the OverlayEntry
                overlayEntry = OverlayEntry(
                  builder: (context) => GestureDetector(
                    onTap: () => overlayEntry.remove(),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          overlayEntry.remove();
                        },
                        child: const Text('Close Intro Overlay'),
                      ),
                    ),
                  ),
                );

                /// Insert the OverlayEntry
                Overlay.of(context).insert(overlayEntry);
              },
              child: const Text('Show Intro Overlay'),
            ),
            ElevatedButton(
              onPressed: () {
                /// Start the intro guide
                intro.start();
              },
              child: const Text('Start Guided Intro'),
            ),
          ],
        ),
      ),
    );
  }
}
