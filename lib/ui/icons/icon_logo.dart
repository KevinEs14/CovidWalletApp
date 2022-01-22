import 'package:flutter/material.dart';
class IconLogo extends StatelessWidget {
  final double width;
  const IconLogo({Key? key,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, (width*0.9250936329588015).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}




//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.004692884,size.height*0.5123927);
    path_0.lineTo(size.width*0.02873408,size.height*0.5174615);
    path_0.lineTo(size.width*0.02873408,size.height*0.4895709);
    path_0.lineTo(0,size.height*0.4851336);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.1233558,size.height*0.5254494);
    path_1.lineTo(size.width*0.1632322,size.height*0.5330567);
    path_1.lineTo(size.width*0.1679213,size.height*0.5755263);
    path_1.lineTo(size.width*0.1292135,size.height*0.5660162);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width*0.2715768,size.height*0.5662794);
    path_2.lineTo(size.width*0.3214195,size.height*0.5773725);
    path_2.lineTo(size.width*0.3266966,size.height*0.6293522);
    path_2.lineTo(size.width*0.2791985,size.height*0.6160405);
    path_2.close();

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_2,paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width*0.4322097,size.height*0.4851336);
    path_3.lineTo(size.width*0.4814682,size.height*0.4971781);
    path_3.lineTo(size.width*0.4855880,size.height*0.5472551);
    path_3.lineTo(size.width*0.4375019,size.height*0.5348947);
    path_3.close();

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_3,paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width*0.6693745,size.height*0.5357854);
    path_4.lineTo(size.width*0.7180449,size.height*0.5465587);
    path_4.lineTo(size.width*0.7227378,size.height*0.5985385);
    path_4.lineTo(size.width*0.6758277,size.height*0.5860202);
    path_4.close();

    Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    paint_4_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_4,paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width*0.1663895,size.height*0.6774008);
    path_5.lineTo(size.width*0.1740112,size.height*0.7274777);
    path_5.lineTo(size.width*0.2220974,size.height*0.7401538);
    path_5.lineTo(size.width*0.2156479,size.height*0.6888097);
    path_5.close();

    Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    paint_5_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_5,paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width*0.3165206,size.height*0.7797328);
    path_6.lineTo(size.width*0.3259026,size.height*0.8323441);
    path_6.lineTo(size.width*0.3734082,size.height*0.8418543);
    path_6.lineTo(size.width*0.3675431,size.height*0.7911457);
    path_6.close();

    Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
    paint_6_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_6,paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width*0.1386554,size.height*0.8303846);
    path_7.lineTo(size.width*0.1785318,size.height*0.8405263);
    path_7.lineTo(size.width*0.1835206,size.height*0.8817287);
    path_7.lineTo(size.width*0.1415730,size.height*0.8709514);
    path_7.close();

    Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
    paint_7_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_7,paint_7_fill);

    Path path_8 = Path();
    path_8.moveTo(size.width*0.4322097,size.height*0.9502915);
    path_8.lineTo(size.width*0.4902622,size.height*0.9636032);
    path_8.lineTo(size.width*0.4967116,size.height*1.020652);
    path_8.lineTo(size.width*0.4421760,size.height*1.008607);
    path_8.close();

    Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
    paint_8_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_8,paint_8_fill);

    Path path_9 = Path();
    path_9.moveTo(size.width*0.6186929,size.height*1.113615);
    path_9.lineTo(size.width*0.6685356,size.height*1.126291);
    path_9.lineTo(size.width*0.6764532,size.height*1.177636);
    path_9.lineTo(size.width*0.6263146,size.height*1.167494);
    path_9.close();

    Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
    paint_9_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_9,paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width*0.8424569,size.height*1.218016);
    path_10.lineTo(size.width*0.8934757,size.height*1.229425);
    path_10.lineTo(size.width*0.8981648,size.height*1.282672);
    path_10.lineTo(size.width*0.8471498,size.height*1.268729);
    path_10.close();

    Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
    paint_10_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_10,paint_10_fill);

    Path path_11 = Path();
    path_11.moveTo(size.width*1.415697,size.height*0.01922267);
    path_11.lineTo(size.width*1.476682,size.height*0.3877206);
    path_11.cubicTo(size.width*1.476682,size.height*0.3877206,size.width*1.486064,size.height*0.4240607,size.width*1.454007,size.height*0.4443482);
    path_11.lineTo(size.width*1.400075,size.height*0.4764656);
    path_11.lineTo(size.width*0.9762884,size.height*0.3978623);
    path_11.cubicTo(size.width*0.9762884,size.height*0.3978623,size.width*0.9027940,size.height*0.3843401,size.width*0.9035730,size.height*0.3336275);
    path_11.cubicTo(size.width*0.9035730,size.height*0.3336275,size.width*0.8918464,size.height*0.2862955,size.width*0.9309401,size.height*0.2643239);
    path_11.lineTo(size.width*1.364876,size.height*0.01246154);
    path_11.cubicTo(size.width*1.364876,size.height*0.01246154,size.width*1.400831,size.height*-0.01965587,size.width*1.415700,size.height*0.01922267);

    Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
    paint_11_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_11,paint_11_fill);

    Path path_12 = Path();
    path_12.moveTo(size.width*1.295109,size.height*1.126976);
    path_12.lineTo(size.width*1.241925,size.height*0.8041174);
    path_12.cubicTo(size.width*1.232543,size.height*0.7398866,size.width*1.173124,size.height*0.7356599,size.width*1.173124,size.height*0.7356599);
    path_12.lineTo(size.width*0.8048689,size.height*0.6688907);
    path_12.cubicTo(size.width*0.7149551,size.height*0.6562146,size.width*0.6946255,size.height*0.6177045,size.width*0.6946255,size.height*0.6177045);
    path_12.lineTo(size.width*0.7054869,size.height*0.6856883);
    path_12.lineTo(size.width*0.4162921,size.height*0.6177045);
    path_12.lineTo(size.width*0.4217640,size.height*0.6655101);
    path_12.lineTo(size.width*0.8650824,size.height*0.7737976);
    path_12.cubicTo(size.width*0.8829551,size.height*0.7786883,size.width*0.8913783,size.height*0.7878907,size.width*0.8953184,size.height*0.7948826);
    path_12.arcToPoint(Offset(size.width*0.8975206,size.height*0.8137935),radius: Radius.elliptical(size.width*0.02149813, size.height*0.02323887),rotation: 0 ,largeArc: false,clockwise: true);
    path_12.cubicTo(size.width*0.8922135,size.height*0.8321984,size.width*0.8708165,size.height*0.8216599,size.width*0.8708165,size.height*0.8216599);
    path_12.lineTo(size.width*0.4452172,size.height*0.7170648);
    path_12.lineTo(size.width*0.4452172,size.height*0.7660850);
    path_12.lineTo(size.width*0.9659401,size.height*0.8919960);
    path_12.cubicTo(size.width*0.9902472,size.height*0.8967733,size.width*0.9982659,size.height*0.9129433,size.width*1.000876,size.height*0.9220202);
    path_12.arcToPoint(Offset(size.width*0.9984569,size.height*0.9370243),radius: Radius.elliptical(size.width*0.01471161, size.height*0.01590283),rotation: 0 ,largeArc: false,clockwise: true);
    path_12.cubicTo(size.width*0.9888352,size.height*0.9493279,size.width*0.9659401,size.height*0.9401700,size.width*0.9659401,size.height*0.9401700);
    path_12.lineTo(size.width*0.5351311,size.height*0.8311741);
    path_12.lineTo(size.width*0.5404082,size.height*0.8835749);
    path_12.lineTo(size.width*1.079311,size.height*1.012887);
    path_12.cubicTo(size.width*1.119187,size.height*1.024721,size.width*1.112929,size.height*1.050498,size.width*1.112929,size.height*1.050498);
    path_12.cubicTo(size.width*1.110584,size.height*1.072049,size.width*1.075401,size.height*1.061061,size.width*1.075401,size.height*1.061061);
    path_12.lineTo(size.width*0.7595281,size.height*0.9858300);
    path_12.lineTo(size.width*0.7665655,size.height*1.046680);
    path_12.cubicTo(size.width*0.7822022,size.height*1.103308,size.width*0.8486592,size.height*1.107534,size.width*0.8486592,size.height*1.107534);
    path_12.lineTo(size.width*1.259925,size.height*1.169231);
    path_12.cubicTo(size.width*1.306839,size.height*1.170073,size.width*1.295109,size.height*1.126972,size.width*1.295109,size.height*1.126972);
    path_12.moveTo(size.width*1.177333,size.height*0.9281862);
    path_12.cubicTo(size.width*1.174816,size.height*0.9409028,size.width*1.160453,size.height*0.9483603,size.width*1.145251,size.height*0.9448462);
    path_12.cubicTo(size.width*1.130049,size.height*0.9413320,size.width*1.119783,size.height*0.9281741,size.width*1.122285,size.height*0.9154575);
    path_12.cubicTo(size.width*1.124787,size.height*0.9027409,size.width*1.139165,size.height*0.8952794,size.width*1.154367,size.height*0.8987976);
    path_12.cubicTo(size.width*1.169569,size.height*0.9023158,size.width*1.179835,size.height*0.9154696,size.width*1.177333,size.height*0.9281862);

    Paint paint_12_fill = Paint()..style=PaintingStyle.fill;
    paint_12_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_12,paint_12_fill);

    Path path_13 = Path();
    path_13.moveTo(size.width*1.043798,size.height*0.4155425);
    path_13.arcToPoint(Offset(size.width*1.041094,size.height*0.4038583),radius: Radius.elliptical(size.width*0.005741573, size.height*0.006206478),rotation: 0 ,largeArc: false,clockwise: true);
    path_13.lineTo(size.width*1.450794,size.height*0.1680526);
    path_13.arcToPoint(Offset(size.width*1.456191,size.height*0.1790121),radius: Radius.elliptical(size.width*0.005741573, size.height*0.006206478),rotation: 0 ,largeArc: false,clockwise: true);
    path_13.lineTo(size.width*1.046491,size.height*0.4148138);
    path_13.arcToPoint(Offset(size.width*1.043798,size.height*0.4155425),radius: Radius.elliptical(size.width*0.005726592, size.height*0.006190283),rotation: 0 ,largeArc: false,clockwise: true);

    Paint paint_13_fill = Paint()..style=PaintingStyle.fill;
    paint_13_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_13,paint_13_fill);

    Path path_14 = Path();
    path_14.moveTo(size.width*1.187869,size.height*0.5310243);
    path_14.arcToPoint(Offset(size.width*1.185154,size.height*0.5193441),radius: Radius.elliptical(size.width*0.005741573, size.height*0.006206478),rotation: 0 ,largeArc: false,clockwise: true);
    path_14.lineTo(size.width*1.525266,size.height*0.3224170);
    path_14.arcToPoint(Offset(size.width*1.530689,size.height*0.3333482),radius: Radius.elliptical(size.width*0.005741573, size.height*0.006206478),rotation: 0 ,largeArc: true,clockwise: true);
    path_14.lineTo(size.width*1.190577,size.height*0.5302753);
    path_14.arcToPoint(Offset(size.width*1.187873,size.height*0.5310121),radius: Radius.elliptical(size.width*0.005719101, size.height*0.006182186),rotation: 0 ,largeArc: false,clockwise: true);

    Paint paint_14_fill = Paint()..style=PaintingStyle.fill;
    paint_14_fill.color = const Color(0xff8da7fa).withOpacity(1.0);
    canvas.drawPath(path_14,paint_14_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}