import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final void Function()? onAction;
  final Widget? floatingAction;
  final bool? fullView;
  final Icon? actionIcon;
  final Color? backgroundColor;

  const MainScaffold({
    super.key,
    required this.title,
    required this.body,
    this.onAction,
    this.floatingAction,
    this.fullView = false,
    this.actionIcon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text(title)),
      floatingActionButton: () {
        if (floatingAction != null) {
          return floatingAction;
        } else if (onAction != null) {
          return FloatingActionButton(onPressed: onAction, child: actionIcon ?? const Icon(Icons.animation));
        } else {
          return null;
        }
      }(),
      body: Padding(
        padding: fullView! ? EdgeInsets.zero : const EdgeInsets.all(10),
        child: body,
      ),
    );
  }
}
