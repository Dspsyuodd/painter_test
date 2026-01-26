import 'package:flutter/material.dart';
import 'package:neo_canvas/core/ui/widgets/app_background.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final bool extendBodyBehindAppBar;

  const AppScaffold({
    this.extendBodyBehindAppBar = false,
    super.key,
    this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: Stack(
        children: [
          const Positioned.fill(child: AppBackground()),
          Padding(
            padding: EdgeInsets.only(bottom: bottomInset),
            child: body,
          ),
        ],
      ),
    );
  }
}
