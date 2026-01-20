import 'package:flutter/material.dart';

class AppErrorContainer extends StatelessWidget {
  final String? error;
  const AppErrorContainer({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final error = this.error;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        child: FadeTransition(opacity: animation, child: child),
      ),
      child: error != null
          ? Center(
              child: Text(
                error,
                style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
                textAlign: TextAlign.center,
              ),
            )
          : null,
    );
  }
}
