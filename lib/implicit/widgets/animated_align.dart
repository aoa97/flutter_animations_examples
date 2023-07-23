import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class AnimatedAlignExample extends HookWidget {
  const AnimatedAlignExample({super.key});

  @override
  Widget build(BuildContext context) {
    final index = useState<int>(0);

    Alignment shakeAlignment(int i) {
      switch (i) {
        case 0:
          return Alignment.center;
        case 1:
          return Alignment.centerLeft;
        case 2:
          return Alignment.centerRight;
        case 3:
          return Alignment.topRight;
        case 4:
          return Alignment.topLeft;
        default:
          index.value = 0;
          return Alignment.center;
      }
    }

    return MainScaffold(
      title: "AnimatedAlign",
      githubPath: "/implicit/widgets/animated_align.dart",
      onAction: () => index.value = index.value + 1,
      body: Stack(
        children: [
          AnimatedItem("jerry", shakeAlignment(index.value)),
          AnimatedItem("tom", shakeAlignment(index.value + 1)),
        ],
      ),
    );
  }
}

class AnimatedItem extends StatelessWidget {
  final String assetName;
  final Alignment alignment;

  const AnimatedItem(this.assetName, this.alignment, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: alignment,
      duration: const Duration(milliseconds: 1000),
      child: SizedBox.square(
        dimension: 100,
        child: Image.asset("assets/$assetName.png"),
      ),
    );
  }
}
