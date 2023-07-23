import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class TextTransitionExample extends HookWidget {
  const TextTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 1));
    final textStyleAnimation = TextStyleTween(
      begin: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white),
      end: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.amber),
    ).animate(controller);

    return MainScaffold(
      title: "DefaultTextStyleTransition",
      githubPath: "/explicit/widgets/text_style_transition_example.dart",
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
        child: DefaultTextStyleTransition(
          style: textStyleAnimation,
          child: const Text("Tom & Jerry"),
        ),
      ),
    );
  }
}
