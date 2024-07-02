import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomFab extends SingleChildRenderObjectWidget {
  final VoidCallback onPressed;

  const CustomFab({super.key, required this.onPressed});

  @override
  RenderBox createRenderObject(BuildContext context) {
    return CustomFabRenderBox(onPressed: onPressed);
  }
}

// lib/presentation/widgets/custom_fab_render_box.dart

class CustomFabRenderBox extends RenderBox {
  final VoidCallback onPressed;

  CustomFabRenderBox({required this.onPressed});

  @override
  void performLayout() {
    size = constraints.constrain(const Size(56.0, 56.0)); // Standard FAB size
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()
      ..color = const Color.fromARGB(255, 234, 231, 35)
      ..style = PaintingStyle.fill;

    context.canvas.drawCircle(offset + Offset(size.width / 2, size.height / 2),
        size.width / 2, paint);

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '+',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width);

    textPainter.paint(
        context.canvas,
        offset +
            Offset((size.width - textPainter.width) / 2,
                (size.height - textPainter.height) / 2));
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, covariant HitTestEntry entry) {
    if (event is PointerDownEvent) {
      onPressed();
    }
  }
}
