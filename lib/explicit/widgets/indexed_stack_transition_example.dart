import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

//* A Stack that paints a Single widget
//* Easily Swich Between Widgets
//* Like a TV, Switch bw channel 1 at a time

class IndexedStackTransitionExample extends HookWidget {
  const IndexedStackTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 1));
    final scaleAnimation = Tween<double>(begin: .5, end: 1).animate(controller);
    final fadeAnimation = Tween<double>(begin: .0, end: 1).animate(controller);
    final index = useState<int>(0);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 200), () => controller.forward());
      return null;
    }, []);

    return MainScaffold(
      fullView: true,
      title: "IndexedStackTransition",
      githubPath: "/explicit/widgets/indexed_stack_transition_example.dart",
      onAction: () {
        index.value = index.value == 2 ? 0 : index.value + 1;
        controller.reset();
        controller.forward();
      },
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IndexedStack(
              index: index.value,
              alignment: Alignment.center,
              children: [
                ScaleTransition(
                  scale: scaleAnimation,
                  child: FadeTransition(
                    opacity: fadeAnimation,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.teal,
                      child: Image.asset("assets/tom.png"),
                    ),
                  ),
                ),
                ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                    child: Image.asset("assets/jerry.png"),
                  ),
                ),
                ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.yellow,
                    child: Image.asset("assets/dog.png"),
                  ),
                ),
              ],
            ),
            Text(
              "Your Character",
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
