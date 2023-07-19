import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class AnimatedTextExample extends HookWidget {
  const AnimatedTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargeFont = useState<bool>(false);

    return MainScaffold(
      title: "AnimatedText",
      floatingAction: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            child: const Icon(Icons.remove),
            onPressed: () => isLargeFont.value = false,
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "btn2",
            child: const Icon(Icons.add),
            onPressed: () => isLargeFont.value = true,
          ),
        ],
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: isLargeFont.value ? 48 : 24,
            color: isLargeFont.value ? Colors.amber : Colors.white,
            fontWeight: isLargeFont.value ? FontWeight.bold : FontWeight.normal,
            shadows: [
              BoxShadow(
                spreadRadius: 12,
                offset: isLargeFont.value ? const Offset(2, 2) : const Offset(1, 1),
              )
            ],
          ),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: const Text("Tom & Jerry"),
        ),
      ),
    );
  }
}
