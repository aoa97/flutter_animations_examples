import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class CustomPainterExample extends HookWidget {
  const CustomPainterExample({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 2))..repeat(reverse: true);
    final sizeAnimation = Tween<double>(begin: 50, end: 150).animate(controller);
    final colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );

    return MainScaffold(
      fullView: true,
      title: "CustomPainterExample",
      githubPath: "/more/widgets/custom_painter_example.dart",
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return CustomPaint(
              painter: CirclePainter(sizeAnimation.value, colorAnimation.value!),
              size: const Size.square(200),
            );
          },
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double _size;
  final Color _color;

  CirclePainter(this._size, this._color);

  @override
  //* Where drawing occurs
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), _size, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate._color != _color || oldDelegate._size != _size;
  }
}
