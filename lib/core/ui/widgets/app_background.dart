import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.fill,
          opacity: const AlwaysStoppedAnimation(.25),
        ),
        Positioned.fill(
          bottom: -25,
          child: SvgPicture.asset(
            'assets/svg/pattern.svg',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
