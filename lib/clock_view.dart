import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override void initState(){
    Timer.periodic(Duration(seconds: 1),(timer){
      setState(() {

      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle:  -pi/2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {

  var dateTime = DateTime.now();
  // 60 sec - 360 1sec - 6 degree
  //60 min - 360 1 min - 6 degree
  //12 hours - 360, 1 hour - 30 degree, 1 min - 0.5 degree
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
      ..color = Color(0xFFFD9804)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xffea74ab), Color(0xffc279fb)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xff748ef6), Color(0xff77ddff)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    var hourHandX = centerX + 60*cos((dateTime.hour* 30 + dateTime.minute*0.5)  * pi /180);
    var hourHandY = centerX + 60*sin((dateTime.hour* 30 + dateTime.minute*0.5) * pi /180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80*cos(dateTime.minute * pi /180);
    var minHandY = centerX + 80*sin(dateTime.minute * pi /180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80*cos(dateTime.second*6* pi /180);
    var secHandY = centerX + 80*sin(dateTime.second*6* pi /180);
    canvas.drawLine(center, Offset(secHandX,secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
