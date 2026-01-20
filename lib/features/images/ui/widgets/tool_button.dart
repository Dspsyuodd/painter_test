import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToolButton extends StatelessWidget {
  final String iconPath;
  final void Function()? onTap;

  const ToolButton({required this.iconPath, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            iconPath,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
