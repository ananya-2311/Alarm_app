import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xff444974);

    var outlineBrush = Paint()
      ..color = Color(0xffeaecff)
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    var centerFillBrush = Paint()..color = Color(0xffeaecff);

    var secHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);
    canvas.drawLine(center, Offset(100,100), secHandBrush);
    canvas.drawLine(center, Offset(150,100), minHandBrush);
    canvas.drawLine(center, Offset(200,100), hourHandBrush);
    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
