import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Animated Arc Example'),
      ),
      body: AnimatedArc(),
    ),
  ));
}

class AnimatedArc extends StatefulWidget {
  @override
  _AnimatedArcState createState() => _AnimatedArcState();
}

class _AnimatedArcState extends State<AnimatedArc>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sweepAngleTween;

  late AnimationController _controllerSec;
  late Animation<double> _sweepAngleTweenSec;

  int secForLoop = 5;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init(){
    // Initialize the animation controller
    _controller = AnimationController(
      duration: Duration(seconds: secForLoop),
      vsync: this,
    );


    _controllerSec = AnimationController(
      duration: Duration(seconds: secForLoop * 2),
      vsync: this,
    );

    // Define a tween for the sweep angle of the arc
    _sweepAngleTween = Tween<double>(begin: 0, end: 360).animate(_controller);
    _sweepAngleTweenSec = Tween<double>(begin: 0, end: 360).animate(_controllerSec);

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    // Start the animation
    _controller.forward();
  }

  void _reset(){
    print("_reset");
    setState(() {
      secForLoop -= 1;
      if(secForLoop <= 0) secForLoop = 30;
      _controller.duration = Duration(seconds: secForLoop);
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: AnimatedBuilder(
              animation: _sweepAngleTween,
              builder: (context, child) {
                return CustomPaint(
                  painter: MyArcPainter(_sweepAngleTween.value),
                );
              },
            ),
          ),
        ),
        ElevatedButton(onPressed: _reset, child: Text("Reset")),
        Text(secForLoop.toString())
      ],
    );
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}

class MyArcPainter extends CustomPainter {
  final double sweepAngle;

  MyArcPainter(this.sweepAngle);

  @override
  void paint(Canvas canvas, Size size) {
    double xCenter = size.width / 2;
    double yCenter = size.height / 2;
    Offset center = Offset(xCenter, yCenter);
    double radius = 50.0;
    // Angle in radians
    double startAngleInRadians = 0;
    double angleInRadians = sweepAngle * (pi / 180); //  pi / sweepAngle; // Replace this with the desired angle
    // ဒီ angle က သီးသန့် လုပ်မှ ရမယ်။ ပထမ တစ်ခုကို မူတည်လို့မရ
    double nextAngleInRadians = (sweepAngle/ 3 ) * (pi / 180); //  pi / sweepAngle; // Replace this with the desired angle

    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Draw the arc with the animated sweep angle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngleInRadians, // 0, // start angle
      angleInRadians, //  sweepAngle * (3.1415926535897932 / 180), // sweep angle in radians
      false,
      paint,
    );

    // draw line from center to current
    // Center of the circle



    // Calculate the coordinates of the point on the circle

    double x = xCenter + radius * cos(angleInRadians);
    double y = yCenter + radius * sin(angleInRadians);

    Offset currentPoint = Offset(x, y);
    canvas.drawLine(center, currentPoint, paint);



    // ဒုတိယ Circle ရဲ့ လက်ရှိ Point
    double nextX = x + radius * cos(nextAngleInRadians);
    double nextY = y + radius * sin(nextAngleInRadians);
    Offset nextPoint = Offset(nextX, nextY);
    canvas.drawLine(currentPoint, nextPoint, paint);


    // now we need to draw another line
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Always return true to trigger a repaint
  }
}
