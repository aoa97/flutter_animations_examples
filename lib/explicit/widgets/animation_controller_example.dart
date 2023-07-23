import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';
import 'package:print_color/print_color.dart';

class AnimationControllerExample extends HookWidget {
  const AnimationControllerExample({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimationController animationController = useAnimationController(
      vsync: useSingleTickerProvider(), // default
      duration: const Duration(seconds: 2),
    );

    final Color? animation = useAnimation(
      ColorTween(begin: Colors.blue, end: Colors.green).animate(animationController),
    );

    animationListener() {
      Print.blue("Value: ${animationController.value}"); // 0 .... 1
    }

    animationStatusListener(AnimationStatus status) {
      Print.green(status); // dismissed, forward -> completed, reverse -> dismissed
    }

    useEffect(() {
      animationController.addListener(animationListener);
      animationController.addStatusListener(animationStatusListener);
      return null; //* animationController is disposed automatically
    }, []);

    return MainScaffold(
      title: "Basic Controlled Animation",
      githubPath: "/explicit/widgets/animation_controller_example.dart",
      floatingAction: Wrap(
        spacing: 30,
        direction: Axis.vertical,
        children: [
          FloatingActionButton(
            heroTag: "0",
            child: const Icon(Icons.animation),
            onPressed: () => animationController.forward(),
          ),
          FloatingActionButton(
            heroTag: "1",
            child: const Icon(Icons.restart_alt),
            onPressed: () => animationController.reverse(),
          ),
        ],
      ),
      body: Container(
        width: 500,
        height: 500,
        padding: const EdgeInsets.all(10),
        color: animation,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
          border: TableBorder.all(width: 1.5, borderRadius: BorderRadius.circular(4)),
          children: [
            _tableRow("Status", animationController.status),
            _tableRow("Value", animationController.value),
            _tableRow("Animation", animation!),
          ],
        ),
      ),
    );
  }

  TableRow _tableRow(String key, dynamic value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(key),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
