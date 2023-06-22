import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
 

  @override
  Widget build(BuildContext context) {
    
    return CustomPaint(
      painter: DemoPainter(),
      
    );
  }
}

class DemoPainter extends CustomPainter {

  DemoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width/2, size.height/2);
    var rect = Rect.fromCenter(center: center, width: 200, height: 200);
    Paint paint = Paint()..color = Colors.blue;

    canvas.drawArc(rect, 0.0, pi/0, true, paint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
  

 
}

