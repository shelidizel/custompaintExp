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

    List<Offset> hoverPositions = [];
    
    return Listener(
      onPointerHover: (event) {
        setState(() {
          hoverPositions.add(event.localPosition);
        });
      },
      child: CustomPaint(
        painter: DemoPainter(
          hoverPositions: hoverPositions
        ),
        
      ),
    );
  }
}

class DemoPainter extends CustomPainter {
  List<Offset> hoverPositions;
  DemoPainter({required this.hoverPositions});

  bool isArcHovered = false;

  @override
  void paint(Canvas canvas, Size size, ) {

    Offset center = Offset(size.width/2, size.height/2);
    var rect = Rect.fromCenter(center: center, width: 200, height: 200);
    
    
    Paint paint = Paint()..color = isArcHovered? Colors.blue : Colors.red;

   Path path = Path();
   path.arcTo(rect, 0.0, pi / 1, true);

   if(hoverPositions.isNotEmpty){
    print("hoverPostions id not empty");
     for (var hoverPosition in hoverPositions) {
       if(path.contains(hoverPosition)){
        isArcHovered = true;
        print(hoverPosition);
       }
     }
    } else {
      print('hoverpositions is empty');
    }

    canvas.drawPath(path, paint);
    
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
  

 
}

