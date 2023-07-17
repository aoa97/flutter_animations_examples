import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

//* CrossFade => Cinematic Term => 1 scene gradually fades into another

class AnimatedSwitcherExample extends HookWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  Widget build(BuildContext context) {
    final sceneNo = useState<int>(0);

    const scenes = [
      (asset: "jerry", color: Colors.red),
      (asset: "tom", color: Colors.green),
      (asset: "dog", color: Colors.blue),
    ];

    return MainScaffold(
      title: "AnimatedSwitcher",
      backgroundColor: Colors.white.withOpacity(.8),
      floatingAction: Wrap(
        spacing: 30,
        children: [
          FloatingActionButton(heroTag: "0", child: const Text("Jerry"), onPressed: () => sceneNo.value = 0),
          FloatingActionButton(heroTag: "1", child: const Text("Tom"), onPressed: () => sceneNo.value = 1),
          FloatingActionButton(heroTag: "2", child: const Text("Dog"), onPressed: () => sceneNo.value = 2),
        ],
      ),
      body: Center(
        child: AnimatedSwitcher(
          // transitionBuilder: ,
          duration: const Duration(seconds: 1),
          child: _scene(id: sceneNo.value, asset: scenes[sceneNo.value].asset, color: scenes[sceneNo.value].color),
        ),
      ),
    );
  }
}

_scene({required int id, required String asset, required Color color}) {
  return ClipOval(
    key: ValueKey(id),
    child: Container(
      width: 200,
      height: 200,
      color: color,
      child: UnconstrainedBox(child: Image.asset("assets/$asset.png", width: 140)),
    ),
  );
}
