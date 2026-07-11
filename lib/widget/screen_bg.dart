import 'package:flutter/material.dart';

class ScreenBg extends StatelessWidget {
  final Widget child;
  const ScreenBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset('assets/images/BG_image.png',
        fit: BoxFit.cover,
        )),
        child,
      ],
    );
  }
}
