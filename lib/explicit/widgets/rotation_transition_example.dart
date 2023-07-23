import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class RotationTransitionExample extends HookWidget {
  const RotationTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 2))..forward();
    final animation = Tween<double>(begin: 0, end: 2).animate(controller); // 2 turns (2 * 180 deg)

    return MainScaffold(
      fullView: true,
      title: "RotationTransition",
      githubPath: "/explicit/widgets/rotation_transition_example.dart",
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
        child: RotationTransition(
          turns: animation,
          child: Center(
            child: Image.asset("assets/jerry.png"),
          ),
        ),
      ),
    );
  }
}
