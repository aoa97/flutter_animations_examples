import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class PositionedTransitionExample extends HookWidget {
  const PositionedTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(duration: const Duration(seconds: 1));
    final jerryAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(300, 300, 0, 0),
      end: const RelativeRect.fromLTRB(0, 0, 0, 0),
    ).animate(animationController);
    final tomAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(200, 200, 0, 0),
      end: const RelativeRect.fromLTRB(0, 0, 0, 100),
    ).animate(animationController);
    final spikeAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(100, 100, 0, 0),
      end: const RelativeRect.fromLTRB(0, 0, 0, 100),
    ).animate(animationController);

    useEffect(() {
      return null;
    }, []);

    return MainScaffold(
      fullView: true,
      backgroundColor: Colors.white.withOpacity(.8),
      title: "PositionedTransition",
      floatingAction: Wrap(
        spacing: 30,
        children: [
          FloatingActionButton(
            heroTag: "1",
            child: const Icon(Icons.restart_alt),
            onPressed: () => animationController.reverse(),
          ),
          FloatingActionButton(
            heroTag: "0",
            child: const Icon(Icons.animation),
            onPressed: () => animationController.forward(),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          final List<Widget> scenes = [
            _sceneItem(asset: "dog", bg: Colors.yellow, rectAnimation: spikeAnimation),
            _sceneItem(asset: "tom", bg: Colors.blue, rectAnimation: tomAnimation),
            _sceneItem(asset: "jerry", bg: Colors.red, rectAnimation: jerryAnimation),
          ];

          if (animationController.status == AnimationStatus.completed) {
            return PageView(reverse: true, children: scenes.reversed.toList());
          } else {
            return Stack(children: scenes);
          }
        },
      ),
    );
  }
}

_sceneItem({required String asset, required Color bg, required Animation<RelativeRect> rectAnimation}) {
  return PositionedTransition(
    rect: rectAnimation,
    child: Container(
      color: bg,
      height: double.infinity,
      child: Image.asset("assets/$asset.png"),
    ),
  );
}
