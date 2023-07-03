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
          hoverPositions: hoverPositions,
          
        ),
        size: Size(MediaQuery.of(context).size.height/2, MediaQuery.of(context).size.width/2),
        
      ),
    );
  }
}

class DemoPainter extends CustomPainter {
  
  List<Offset> hoverPositions = [];
  DemoPainter({required this.hoverPositions});

  bool isArcHovered = false;

  @override
void paint(Canvas canvas, Size size) {
  Offset center = Offset(size.width / 2, size.height / 2);
  var rect = Rect.fromCircle(center: center, radius: size.width / 4);

  Path path = Path();

  final radius = size.width / 4;
  final startAngle = 0.0;
  var endAngle = pi/4;

  path.addArc(rect, startAngle, endAngle);

  if(hoverPositions.isNotEmpty){
    for (var hoverPosition in hoverPositions) {
      if(path.contains(hoverPosition)){
        print('Hover position within');
        isArcHovered = true;
        hoverPositions.clear();
        
      } else if (path.contains(hoverPosition) == false) {
        print('hover position without');
        isArcHovered = false;
      }
    }
    
    
  } 



  Paint paint = Paint()
    ..color = isArcHovered? Colors.red.withOpacity(.7) : Colors.red
    ..strokeWidth = 50
    ..style = PaintingStyle.stroke;

  canvas.drawPath(path, paint);
}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

