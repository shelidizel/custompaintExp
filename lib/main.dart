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
    
    return MouseRegion(
      onEnter: (event) {
        
        
      },
      onHover: (event) {
        final renderObject = context.findRenderObject() as RenderBox;
        final localPosition = renderObject.globalToLocal(event.localPosition);
        print(localPosition);
      },
      onExit: (event){

      },
      child: CustomPaint(
        painter: DemoPainter(),
        
      ),
    );
  }
}

class DemoPainter extends CustomPainter {

  bool isArcHovered = false;

  @override
  void paint(Canvas canvas, Size size, {List<Offset>? hoverPositions}) {

    Offset center = Offset(size.width/2, size.height/2);
    var rect = Rect.fromCenter(center: center, width: 200, height: 200);
    if(hoverPositions != null){
     for (var hoverPosition in hoverPositions) {
       if(rect.contains(hoverPosition)){
        isArcHovered = true;
       }
     }
    }
    
    Paint paint = Paint()..color = isArcHovered? Colors.blue : Colors.red;

    canvas.drawArc(rect, 0.0, pi/1.2, true, paint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
  

 
}

