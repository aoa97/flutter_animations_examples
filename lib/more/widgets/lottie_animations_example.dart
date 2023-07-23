import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:playground/main_scaffold.dart';

// https://lottiefiles.com/featured

class LottieAnimationsExample extends StatelessWidget {
  const LottieAnimationsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      fullView: true,
      title: "Lottie Animations",
      githubPath: "/more/widgets/lottie_animations_example.dart",
      body: Center(
        child: Lottie.asset('assets/lottie/waving_character.json'),
      ),
    );
  }
}
