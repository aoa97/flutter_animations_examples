import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

//* CrossFade => Cinematic Term => 1 scene gradually fades into another
//* Can be replaced with SizedBox & acheive show / hide scenario

class AnimatedCrossFadeExample extends HookWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleAnimation = useState<bool>(false);

    return MainScaffold(
      fullView: true,
      title: "AnimatedCrossFade",
      onAction: () => toggleAnimation.value = !toggleAnimation.value,
      body: AnimatedCrossFade(
        firstChild: _sceneItem(asset: "tom", bg: Colors.yellow),
        secondChild: _sceneItem(asset: "jerry", bg: Colors.red),
        crossFadeState: toggleAnimation.value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(seconds: 1),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
      ),
    );
  }
}

_sceneItem({required String asset, required Color bg}) {
  return Container(
    color: bg,
    height: double.infinity,
    child: Image.asset("assets/$asset.png"),
  );
}
