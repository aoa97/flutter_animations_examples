import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class AnimatedOpacityExample extends HookWidget {
  const AnimatedOpacityExample({super.key});

  @override
  Widget build(BuildContext context) {
    final isVisible = useState<bool>(false);

    return MainScaffold(
      title: "AnimatedOpacity",
      onAction: () => isVisible.value = !isVisible.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Chip(label: Text("Press the button and watch me xD")),
          const SizedBox(height: 50),
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: isVisible.value ? 1 : 0,
            curve: Curves.bounceInOut,
            child: Image.asset("assets/dog.png"),
          ),
        ],
      ),
    );
  }
}
