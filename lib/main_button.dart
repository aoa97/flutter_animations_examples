import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  final String title;
  final Widget page;
  const MButton({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 40),
      ),
      child: Text(title, style: const TextStyle(fontSize: 12)),
    );
  }
}
