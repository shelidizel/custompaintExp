

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
    
    return Container(
      width: 600,
      height: 600,
      decoration: BoxDecoration(
        color: Colors.yellow ),
      child: CustomPaint(
        painter: BezierPainter(),
        foregroundPainter: RectPainter(null, null),
      )
    );
  }
}

class BezierPainter extends CustomPainter {
  
  Offset? bezierControlPntStart;
  Offset? bezierControlPntEnd;
  Offset? bezierEndPoint;
  BezierPainter({this.bezierControlPntEnd,
               this.bezierControlPntStart,
               this.bezierEndPoint});

  bool isArcHovered = false;

  @override
  void paint(Canvas canvas, Size size) {

 
  

  Path path = Path();

  // final radius = size.width / 4;
  // final startAngle = 0.0;
  // var endAngle = pi/4;

  // path.addArc(rect, startAngle, endAngle);

  path.moveTo(size.width/2, size.height/2);

  //creates a parabola curve or something of that sort.
  // path.conicTo(size.width/2 + 200, size.height/2 - 400, 
  //              size.width/2 + 400, size.height/2 , .5);

  path.cubicTo(
    bezierControlPntStart == null? size.width/2 + 100 : bezierControlPntStart!.dx, 
    bezierControlPntStart == null? size.height/2 + 100 : bezierControlPntStart!.dy, 
    bezierControlPntEnd == null? size.width/2 + 300 : bezierControlPntEnd!.dx,
    bezierControlPntEnd == null? size.height/2 - 200 : bezierControlPntEnd!.dy,
    bezierEndPoint  == null ? size.width/2 + 500 : bezierEndPoint!.dx, 
    bezierEndPoint == null?  size.height/2 : bezierEndPoint!.dy
               );

 



  Paint paint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke;
  

  canvas.drawPath(path, paint);
  
  
}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class RectPainter extends CustomPainter {
  Offset? bezierControlPntStart;
  Offset? bezierControlPntEnd;

  RectPainter(this.bezierControlPntEnd, this.bezierControlPntStart);

  

  @override
  void paint(Canvas canvas, Size size) {

  Paint rectPaint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 5
    ..style = PaintingStyle.fill;


  Offset? centerRec1 = bezierControlPntStart ?? Offset(size.width/2 + 100, size.height/2 + 100);
  Offset? centerRec2 = bezierControlPntEnd ?? Offset(size.width/2 + 300, size.height/2 - 200);

  var rect1 = Rect.fromCircle(center: centerRec1, radius: 10);
  var rect2 = Rect.fromCircle(center: centerRec2, radius: 10);

  var rrect1 = RRect.fromRectAndRadius(rect1, const Radius.circular(4));
  var rrect2 = RRect.fromRectAndRadius(rect2, const Radius.circular(4));

    canvas.drawRRect(rrect1, rectPaint);
    canvas.drawRRect(rrect2, rectPaint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

