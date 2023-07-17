import 'package:flutter/material.dart';
import 'package:playground/main_scaffold.dart';

class TweenAnimationBuilderExample extends StatelessWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: "TweenAnimationBuilderExample",
      body: TweenAnimationBuilder(
        tween: ColorTween(begin: Colors.blue, end: Colors.green),
        duration: const Duration(seconds: 2),
        builder: (context, color, child) {
          return Container(
            width: 500,
            height: 500,
            padding: const EdgeInsets.all(10),
            color: color,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
              border: TableBorder.all(width: 1.5, borderRadius: BorderRadius.circular(4)),
              children: [
                _tableRow("Tween", color),
              ],
            ),
          );
        },
      ),
    );
  }

  TableRow _tableRow(String key, dynamic value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(key),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
