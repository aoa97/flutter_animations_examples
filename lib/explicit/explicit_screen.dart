import 'package:flutter/material.dart';
import 'package:playground/explicit/widgets/animated_builder_example.dart';
import 'package:playground/explicit/widgets/animation_controller_example.dart';
import 'package:playground/explicit/widgets/fade_transition_example.dart';
import 'package:playground/explicit/widgets/indexed_stack_transition_example.dart';
import 'package:playground/explicit/widgets/positioned_transition_example.dart';
import 'package:playground/explicit/widgets/rotation_transition_example.dart';
import 'package:playground/explicit/widgets/size_transition_example.dart';
import 'package:playground/explicit/widgets/text_style_transition_example.dart';
import 'package:playground/explicit/widgets/tween_animation_builder_example.dart';
import 'package:playground/main_button.dart';

class ExplicitScreen extends StatelessWidget {
  const ExplicitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MButton(title: "TweenAnimationBuilder", page: TweenAnimationBuilderExample()),
        MButton(title: "AnimatedBuilder", page: AnimatedBuilderExample()),
        MButton(title: "Controlled Animation", page: AnimationControllerExample()),
        MButton(title: "PositionedTransition", page: PositionedTransitionExample()),
        MButton(title: "SizeTransition", page: SizeTransitionExample()),
        MButton(title: "RotationTransition", page: RotationTransitionExample()),
        MButton(title: "FadeTransition", page: FadeTransitionExample()),
        MButton(title: "DefaultTextStyleTransition", page: TextTransitionExample()),
        MButton(title: "IndexedStackTransition", page: IndexedStackTransitionExample()),
      ],
    );
  }
}
