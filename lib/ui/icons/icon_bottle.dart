import 'package:flutter/material.dart';

class IconBottle extends StatelessWidget {
  final double width;
  const IconBottle({Key? key,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width*0.85, (width*1.25).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}

//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.8125000,size.height*0.1500000);
    path_0.lineTo(size.width*0.8125000,size.height*0.2500000);
    path_0.cubicTo(size.width*0.8622250,size.height*0.2500000,size.width*0.9099187,size.height*0.2658035,size.width*0.9450812,size.height*0.2939340);
    path_0.cubicTo(size.width*0.9802437,size.height*0.3220645,size.width,size.height*0.3602175,size.width,size.height*0.4000000);
    path_0.lineTo(size.width,size.height*0.9500000);
    path_0.cubicTo(size.width,size.height*0.9632600,size.width*0.9934125,size.height*0.9759800,size.width*0.9816938,size.height*0.9853550);
    path_0.cubicTo(size.width*0.9699750,size.height*0.9947300,size.width*0.9540750,size.height,size.width*0.9375000,size.height);
    path_0.lineTo(size.width*0.06250000,size.height);
    path_0.cubicTo(size.width*0.04592400,size.height,size.width*0.03002688,size.height*0.9947300,size.width*0.01830581,size.height*0.9853550);
    path_0.cubicTo(size.width*0.006584813,size.height*0.9759800,0,size.height*0.9632600,0,size.height*0.9500000);
    path_0.lineTo(0,size.height*0.4000000);
    path_0.cubicTo(0,size.height*0.3602175,size.width*0.01975444,size.height*0.3220645,size.width*0.05491750,size.height*0.2939340);
    path_0.cubicTo(size.width*0.09008062,size.height*0.2658035,size.width*0.1377719,size.height*0.2500000,size.width*0.1875000,size.height*0.2500000);
    path_0.lineTo(size.width*0.1875000,size.height*0.1500000);
    path_0.lineTo(size.width*0.8125000,size.height*0.1500000);
    path_0.close();
    path_0.moveTo(size.width*0.5625000,size.height*0.4500000);
    path_0.lineTo(size.width*0.4375000,size.height*0.4500000);
    path_0.lineTo(size.width*0.4375000,size.height*0.5500000);
    path_0.lineTo(size.width*0.3125000,size.height*0.5500000);
    path_0.lineTo(size.width*0.3125000,size.height*0.6500000);
    path_0.lineTo(size.width*0.4374375,size.height*0.6500000);
    path_0.lineTo(size.width*0.4375000,size.height*0.7500000);
    path_0.lineTo(size.width*0.5625000,size.height*0.7500000);
    path_0.lineTo(size.width*0.5624375,size.height*0.6500000);
    path_0.lineTo(size.width*0.6875000,size.height*0.6500000);
    path_0.lineTo(size.width*0.6875000,size.height*0.5500000);
    path_0.lineTo(size.width*0.5625000,size.height*0.5500000);
    path_0.lineTo(size.width*0.5625000,size.height*0.4500000);
    path_0.close();
    path_0.moveTo(size.width*0.9375000,0);
    path_0.lineTo(size.width*0.9375000,size.height*0.1000000);
    path_0.lineTo(size.width*0.06250000,size.height*0.1000000);
    path_0.lineTo(size.width*0.06250000,0);
    path_0.lineTo(size.width*0.9375000,0);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
