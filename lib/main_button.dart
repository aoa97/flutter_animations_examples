import 'package:flutter/material.dart';
import 'package:playground/extensions.dart';

class MButton extends StatelessWidget {
  final String title;
  final Widget? page;
  final void Function()? onTap;
  const MButton({super.key, required this.title, this.page, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap ?? () => context.push(MaterialPageRoute(builder: (_) => page!)),
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
      ),
      child: Text(title, style: const TextStyle(fontSize: 12)),
    );
  }
}
