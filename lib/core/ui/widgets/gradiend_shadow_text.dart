import 'package:flutter/material.dart';

class GradientShadowText extends StatelessWidget {
  const GradientShadowText(
    this.text, {
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) =>
              const LinearGradient(
                colors: [
                  Color.fromARGB(255, 137, 36, 231),
                  Color.fromARGB(255, 106, 70, 249),
                ],
              ).createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              text,
              style: (style ?? const TextStyle()).copyWith(
                shadows: [
                  const Shadow(
                    blurRadius: 15,
                  ),
                  const Shadow(
                    blurRadius: 15,
                  ),
                  const Shadow(
                    blurRadius: 15,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            text,
            style: style,
          ),
        ),
      ],
    );
  }
}
