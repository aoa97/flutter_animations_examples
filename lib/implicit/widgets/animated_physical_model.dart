import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

//* PhysicalModel -> Create a Visual Representation of a Physical Object => 3d appearance / real-life obj simulation

class AnimatedPhysicalModelExample extends HookWidget {
  const AnimatedPhysicalModelExample({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleAnimation = useState<bool>(false);

    return MainScaffold(
      title: "AnimatedPhysicalModel",
      githubPath: "/implicit/widgets/animated_physical_model.dart",
      onAction: () => toggleAnimation.value = !toggleAnimation.value,
      body: Center(
        child: AnimatedPhysicalModel(
          curve: Curves.easeInOut,
          duration: const Duration(seconds: 1),
          shape: BoxShape.circle,
          clipBehavior: Clip.antiAlias,
          elevation: toggleAnimation.value ? 5 : 80,
          shadowColor: Colors.black,
          color: toggleAnimation.value ? Colors.amber : Colors.transparent,
          child: AnimatedOpacity(
            curve: Curves.linear,
            opacity: toggleAnimation.value ? 1 : .5,
            duration: const Duration(seconds: 1),
            child: SizedBox.square(
              dimension: 250,
              child: UnconstrainedBox(child: Image.asset("assets/tom.png", width: 160)),
            ),
          ),
        ),
      ),
    );
  }
}
