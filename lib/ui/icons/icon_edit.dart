import 'package:flutter/material.dart';

class IconEdit extends StatelessWidget {
  final double width;
  final Color color;
  const IconEdit({Key? key,required this.width,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, (width*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(color: color),
    );
  }
}


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  Color color;

  RPSCustomPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.7911670,size.height*0.08383372);
    path_0.lineTo(size.width*0.9161670,size.height*0.2088340);
    path_0.lineTo(size.width*0.8208755,size.height*0.3041670);
    path_0.lineTo(size.width*0.6958755,size.height*0.1791670);
    path_0.lineTo(size.width*0.7911670,size.height*0.08383372);
    path_0.close();
    path_0.moveTo(size.width*0.3333340,size.height*0.6666670);
    path_0.lineTo(size.width*0.4583340,size.height*0.6666670);
    path_0.lineTo(size.width*0.7619585,size.height*0.3630426);
    path_0.lineTo(size.width*0.6369585,size.height*0.2380426);
    path_0.lineTo(size.width*0.3333340,size.height*0.5416670);
    path_0.lineTo(size.width*0.3333340,size.height*0.6666670);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.7916670,size.height*0.7916670);
    path_1.lineTo(size.width*0.3399170,size.height*0.7916670);
    path_1.cubicTo(size.width*0.3388330,size.height*0.7916670,size.width*0.3377085,size.height*0.7920830,size.width*0.3366255,size.height*0.7920830);
    path_1.cubicTo(size.width*0.3352500,size.height*0.7920830,size.width*0.3338755,size.height*0.7917085,size.width*0.3324585,size.height*0.7916670);
    path_1.lineTo(size.width*0.2083330,size.height*0.7916670);
    path_1.lineTo(size.width*0.2083330,size.height*0.2083330);
    path_1.lineTo(size.width*0.4936255,size.height*0.2083330);
    path_1.lineTo(size.width*0.5769585,size.height*0.1250000);
    path_1.lineTo(size.width*0.2083330,size.height*0.1250000);
    path_1.cubicTo(size.width*0.1623745,size.height*0.1250000,size.width*0.1250000,size.height*0.1623330,size.width*0.1250000,size.height*0.2083330);
    path_1.lineTo(size.width*0.1250000,size.height*0.7916670);
    path_1.cubicTo(size.width*0.1250000,size.height*0.8376670,size.width*0.1623745,size.height*0.8750000,size.width*0.2083330,size.height*0.8750000);
    path_1.lineTo(size.width*0.7916670,size.height*0.8750000);
    path_1.cubicTo(size.width*0.8137681,size.height*0.8750000,size.width*0.8349638,size.height*0.8662202,size.width*0.8505926,size.height*0.8505926);
    path_1.cubicTo(size.width*0.8662202,size.height*0.8349638,size.width*0.8750000,size.height*0.8137681,size.width*0.8750000,size.height*0.7916670);
    path_1.lineTo(size.width*0.8750000,size.height*0.4305000);
    path_1.lineTo(size.width*0.7916670,size.height*0.5138330);
    path_1.lineTo(size.width*0.7916670,size.height*0.7916670);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = color;
    canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
