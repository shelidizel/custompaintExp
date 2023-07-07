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

  List<Offset> hoverPositions = [];

  @override
  void initState() {
    // TODO: implement initState
    hoverPositions.clear();
    print('hover positions cleared');
    super.initState();
  }

  
 

  @override
  Widget build(BuildContext context) {
    
    return CustomPaint(
      painter: DemoPainter(
        
        
      ),
      size: Size(MediaQuery.of(context).size.height/2, MediaQuery.of(context).size.width/2),
      
    );
  }
}

class DemoPainter extends CustomPainter {
  
  Offset? bezierControlPntStart;
  Offset? bezierControlPntEnd;
  Offset? bezierEndPoint;
  DemoPainter({this.bezierControlPntEnd,
               this.bezierControlPntStart,
               this.bezierEndPoint});

  bool isArcHovered = false;

  @override
  void paint(Canvas canvas, Size size) {

 Offset? centerRec1 = bezierControlPntStart ?? Offset(size.width/2 + 100, size.height/2 + 100);
 Offset? centerRec2 = bezierControlPntEnd ?? Offset(size.width/2 + 300, size.height/2 - 200);

 var rect1 = Rect.fromCircle(center: centerRec1, radius: 10);
 var rect2 = Rect.fromCircle(center: centerRec2, radius: 10);

  var rrect1 = RRect.fromRectAndRadius(rect1, const Radius.circular(4));
  var rrect2 = RRect.fromRectAndRadius(rect2, const Radius.circular(4));
  

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
  Paint rectPaint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 5
    ..style = PaintingStyle.fill;

  canvas.drawPath(path, paint);
  
  GestureDetector(
    onTap: () {
      print("kitaturamba");
    },
    child : CustomPaint(
      painter: RectPainter(rectPaint, rrect1),
    )
    
  );
}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class RectPainter extends CustomPainter {
  final Paint rectPaint;
  final RRect rrect1;

  RectPainter(this.rectPaint, this.rrect1);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(rrect1, rectPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

