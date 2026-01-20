import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neo_canvas/core/di/di.dart';
import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/core/ui/widgets/app_background.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    final navigation = getIt<NavigationModule>();
    Future.delayed(const Duration(seconds: 3), navigation.auth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const AppBackground(),
          SvgPicture.asset(
            'assets/svg/launch.svg',
            width: 200,
          ),
        ],
      ),
    );
  }
}
