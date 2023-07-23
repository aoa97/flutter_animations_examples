import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class AnimatedPositionedExample extends HookWidget {
  const AnimatedPositionedExample({super.key});

  @override
  Widget build(BuildContext context) {
    final confetti = useMemoized(() => ConfettiController(duration: const Duration(milliseconds: 800)), []);
    final toggleAnimation = useState<bool>(false);
    final mqs = MediaQuery.sizeOf(context);

    useEffect(() {
      return () {
        confetti.dispose();
      };
    }, []);

    return MainScaffold(
      fullView: true,
      title: "AnimatedPositioned",
      githubPath: "/implicit/widgets/animated_positioned.dart",
      onAction: () async {
        toggleAnimation.value = !toggleAnimation.value;
        await Future.delayed(const Duration(seconds: 1));
        if (toggleAnimation.value) {
          confetti.play();
        }
      },
      body: Container(
        color: Colors.blue,
        child: Stack(
          children: [
            ConfettiWidget(
              confettiController: confetti,
              emissionFrequency: 0.5,
              blastDirectionality: BlastDirectionality.explosive,
            ),
            //* Tom & Jerry
            AnimatedPositioned(
              // Or AnimatedPositionedDirectional's start
              left: !toggleAnimation.value ? 0 : mqs.width - 100,
              bottom: 300,
              duration: const Duration(seconds: 1),
              child: Image.asset("assets/tom.png", width: 100),
            ),
            Positioned(
              bottom: 300,
              right: 0,
              child: Image.asset("assets/jerry.png", width: 50),
            ),
            //* Ground
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(width: double.infinity, color: Colors.brown, height: 300),
            ),
          ],
        ),
      ),
    );
  }
}
