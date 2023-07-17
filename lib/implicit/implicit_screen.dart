import 'package:flutter/material.dart';
import 'package:playground/implicit/widgets/animated_align.dart';
import 'package:playground/implicit/widgets/animated_container.dart';
import 'package:playground/implicit/widgets/animated_cross_fade.dart';
import 'package:playground/implicit/widgets/animated_list.dart';
import 'package:playground/implicit/widgets/animated_opacity.dart';
import 'package:playground/implicit/widgets/animated_padding.dart';
import 'package:playground/implicit/widgets/animated_physical_model.dart';
import 'package:playground/implicit/widgets/animated_positioned.dart';
import 'package:playground/implicit/widgets/animated_switcher.dart';
import 'package:playground/implicit/widgets/animated_text.dart';
import 'package:playground/main_button.dart';

class ImplicitScreen extends StatelessWidget {
  const ImplicitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MButton(title: "AnimatedAlign", page: AnimatedAlignExample()),
        MButton(title: "AnimatedContainer", page: AnimatedContainerExample()),
        MButton(title: "AnimatedText", page: AnimatedTextExample()),
        MButton(title: "AnimatedOpacity", page: AnimatedOpacityExample()),
        MButton(title: "AnimatedPadding", page: AnimatedPaddingExample()),
        MButton(title: "AnimatedPhysicalModel", page: AnimatedPhysicalModelExample()),
        MButton(title: "AnimatedPositioned/AnimatedPositionedDirectional", page: AnimatedPositionedExample()),
        MButton(title: "AnimatedCrossFade(2 Trans)", page: AnimatedCrossFadeExample()),
        MButton(title: "AnimatedSwitcher(Multi Trans)", page: AnimatedSwitcherExample()),
        MButton(title: "AnimatedList", page: AnimatedListExample()),
      ],
    );
  }
}
