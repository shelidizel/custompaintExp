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
  
  List<Offset> hoverPositions = [];
  DemoPainter({required this.hoverPositions});

  bool isArcHovered = false;

  @override
  void paint(Canvas canvas, Size size, ) {


    Offset center = Offset(size.width/2, size.height/2);
    var rect = Rect.fromCenter(center: center, width: 200, height: 200);
    
    
    

   Path path = Path();
     
    
    // Radius of the arc
    final radius = size.width / 4;

    // Start angle of the arc in radians
    final startAngle = 0.0;

    // End angle of the arc in radians
    final endAngle = 1.4; // Example: Half circle (180 degrees)

    // Add the arc to the path using arcTo
    path.arcToPoint(
      center,
      radius: Radius.zero,
      rotation: endAngle - startAngle,
      clockwise: false,
    );

   if(hoverPositions.isNotEmpty){
    print("hoverPostions id not empty");
     for (var hoverPosition in hoverPositions) {
       if(path.contains(hoverPosition)){
        hoverPositions.clear();
        //path.arcTo(rect, 0.0, pi/1, true);
        print("$hoverPosition I am in path.");
       }
     }
    } else {
      print('hoverpositions is empty');
    }

    Paint paint = Paint()..color = isArcHovered? Colors.blue : Colors.red;
    canvas.drawPath(path, paint);
    
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
  

 
}

