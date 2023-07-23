import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class AnimatedPaddingExample extends HookWidget {
  const AnimatedPaddingExample({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleAnimation = useState<bool>(false);

    return MainScaffold(
      title: "AnimatedPadding",
      githubPath: "/implicit/widgets/animated_padding.dart",
      onAction: () => toggleAnimation.value = !toggleAnimation.value,
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _animatedItem(animated: toggleAnimation.value, bg: Colors.blue, asset: "tom"),
          _animatedItem(animated: toggleAnimation.value, bg: Colors.yellow, asset: "dog"),
          _animatedItem(animated: toggleAnimation.value, bg: Colors.green, asset: "cheese"),
          _animatedItem(animated: toggleAnimation.value, bg: Colors.cyan, asset: "jerry"),
        ],
      ),
    );
  }

  _animatedItem({required String asset, required Color bg, required bool animated}) {
    return AnimatedPadding(
      duration: const Duration(seconds: 1),
      curve: Curves.elasticInOut,
      padding: EdgeInsets.all(animated ? 0 : 20),
      child: Container(
        color: bg,
        child: Image.asset("assets/$asset.png"),
      ),
    );
  }
}
