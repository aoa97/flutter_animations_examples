import 'package:flutter/material.dart';
import 'package:playground/extensions.dart';
import 'package:playground/main_button.dart';
import 'package:playground/page_transitions/builders/page_transitons.dart';
import 'package:playground/page_transitions/welcome_screen.dart';

class PageTransitionsScreen extends StatelessWidget {
  const PageTransitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MButton(
          title: "Page Fade Transition",
          onTap: () => context.push(PageFadeTransition(const WelcomeScreen())),
        ),
        MButton(
          title: "Page Scale Transition",
          onTap: () => context.push(PageScaleTransition(const WelcomeScreen())),
        ),
        MButton(
          title: "Page Rotation Transition",
          onTap: () => context.push(PageRotationTransition(const WelcomeScreen())),
        ),
        MButton(
          title: "Page Slide Transition",
          onTap: () => context.push(PageSlideTransition(const WelcomeScreen())),
        ),
        MButton(
          title: "Page Size Transition",
          onTap: () => context.push(PageSizeTransition(const WelcomeScreen())),
        ),
        MButton(
          title: "Page Fade + Size Transition",
          onTap: () => context.push(PageSizeFadeTransition(const WelcomeScreen())),
        ),
        MButton(
          title: "Page Scale + Rotate Transition",
          onTap: () => context.push(PageScaleRotateTransition(const WelcomeScreen())),
        ),
      ],
    );
  }
}
