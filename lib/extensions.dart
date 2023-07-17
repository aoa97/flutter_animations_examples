import 'package:flutter/material.dart';

extension CustomNavigation on BuildContext {
  push(Route route) => Navigator.push(this, route);
  pop() => Navigator.of(this).pop();
}
