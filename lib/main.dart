import 'package:flutter/material.dart';

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

  int secForLoop = 30;

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

    // Define a tween for the sweep angle of the arc
    _sweepAngleTween = Tween<double>(begin: 0, end: 360).animate(_controller);

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
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 50.0;

    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Draw the arc with the animated sweep angle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0, // start angle
      sweepAngle * (3.1415926535897932 / 180), // sweep angle in radians
      false,
      paint,
    );

    // draw line from center to current 
    Offset currentPoint = Offset(dx, dy)
    canvas.drawLine(center, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Always return true to trigger a repaint
  }
}
