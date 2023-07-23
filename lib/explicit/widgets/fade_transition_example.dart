import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class FadeTransitionExample extends HookWidget {
  const FadeTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 2))..forward();
    final animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    return MainScaffold(
      fullView: true,
      title: "FadeTransition",
      githubPath: "/explicit/widgets/fade_transition_example.dart",
      floatingAction: Wrap(
        spacing: 30,
        children: [
          FloatingActionButton(
            heroTag: "2",
            child: const Icon(Icons.stop),
            onPressed: () => controller.reset(),
          ),
          FloatingActionButton(
            heroTag: "1",
            child: const Icon(Icons.restart_alt),
            onPressed: () => controller.reverse(),
          ),
          FloatingActionButton(
            heroTag: "0",
            child: const Icon(Icons.animation),
            onPressed: () => controller.forward(),
          ),
        ],
      ),
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: Text("Welcome", style: Theme.of(context).textTheme.headlineLarge),
        ),
      ),
    );
  }
}
