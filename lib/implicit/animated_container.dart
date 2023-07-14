import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class AnimatedContainerExample extends HookWidget {
  const AnimatedContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleAnimation = useState<bool>(false);

    return MainScaffold(
      title: "AnimatedContainer",
      onAction: () => toggleAnimation.value = !toggleAnimation.value,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          width: toggleAnimation.value ? 250 : 100,
          height: toggleAnimation.value ? 250 : 100,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: toggleAnimation.value ? Colors.orange : Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Image.asset("assets/jerry.png"),
        ),
      ),
    );
  }
}
