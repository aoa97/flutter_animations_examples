import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

//* Example -> Animate PositonedDirectional
//* Use Case -> Custom Drawer Menu

class AnimatedBuilderExample extends HookWidget {
  const AnimatedBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 2))..repeat(reverse: true);

    return MainScaffold(
      title: "AnimatedBuilderExample",
      githubPath: "/explicit/widgets/animated_builder_example.dart",
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Center(
            child: Stack(
              children: [
                _buildScale(controller.value),
                Text(controller.value.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}

_buildScale(val) => Transform.scale(scale: val * 1.2, child: Image.asset("assets/cheese.png"));
// _buildRotate(val) => Transform.rotate(angle: 2 * pi * val, child: Image.asset("assets/jerry.png"));
// _buildRotate(val) => Transform.rotate(angle: 2 * pi * val, child: Image.asset("assets/jerry.png"));
