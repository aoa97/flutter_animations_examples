import 'package:flutter/material.dart';
import 'package:playground/main_scaffold.dart';
import 'package:rive/rive.dart';

// https://rive.app/

class RiveAnimationsExample extends StatelessWidget {
  const RiveAnimationsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      fullView: true,
      title: "Rive Animations",
      body: RiveAnimation.asset('assets/rive/quality_time.riv', fit: BoxFit.cover),
    );
  }
}
