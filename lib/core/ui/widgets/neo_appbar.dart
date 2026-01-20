import 'package:flutter/material.dart';

class NeoAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const NeoAppbar({
    required this.title,
    super.key,
    this.leading,
    this.trailing,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(223, 88, 88, 88),
            ),
            BoxShadow(
              color: Color.fromARGB(255, 26, 13, 49),
              blurRadius: 50,
              spreadRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 10,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 238, 238, 238),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: leading,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: trailing,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
