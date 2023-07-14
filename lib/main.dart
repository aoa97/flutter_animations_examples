import 'package:flutter/material.dart';
import 'package:playground/implicit/animated_align.dart';
import 'package:playground/implicit/animated_container.dart';
import 'package:playground/implicit/animated_cross_fade.dart';
import 'package:playground/implicit/animated_list.dart';
import 'package:playground/implicit/animated_opacity.dart';
import 'package:playground/implicit/animated_padding.dart';
import 'package:playground/implicit/animated_physical_model.dart';
import 'package:playground/implicit/animated_positioned.dart';
import 'package:playground/implicit/animated_switcher.dart';
import 'package:playground/implicit/animated_text.dart';
import 'package:playground/main_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(useMaterial3: true), home: const MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animations Examples")),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
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
        ),
      ),
    );
  }
}
