import 'package:flutter/material.dart';
import 'package:playground/main_button.dart';
import 'package:playground/more/widgets/custom_painter_example.dart';
import 'package:playground/more/widgets/lottie_animations_example.dart';
import 'package:playground/more/widgets/rive_animations_example.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      MButton(title: "Animate a CustomPainter", page: CustomPainterExample()),
      MButton(title: "Lottie Animations", page: LottieAnimationsExample()),
      MButton(title: "Rive Animations", page: RiveAnimationsExample()),
    ]);
  }
}
