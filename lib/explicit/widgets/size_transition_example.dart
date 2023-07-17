import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class SizeTransitionExample extends HookWidget {
  const SizeTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 1));
    final animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 500), () => controller.forward());
      return null;
    }, []);

    return MainScaffold(
      fullView: true,
      title: "SizeTransition",
      backgroundColor: Colors.red,
      floatingAction: Wrap(
        spacing: 30,
        children: [
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
        child: SizeTransition(
          sizeFactor: animation,
          axis: Axis.horizontal,
          child: Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Image.asset("assets/jerry.png"),
            ),
          ),
        ),
      ),
    );
  }
}
