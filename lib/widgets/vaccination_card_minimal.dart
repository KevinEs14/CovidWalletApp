import 'dart:async';
import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/theme/input_styles.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:covid_wallet_app/ui/icons/icon_bottle.dart';
import 'package:covid_wallet_app/ui/icons/icon_edit.dart';
import 'package:covid_wallet_app/ui/icons/icon_pharmacy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class VaccinationCardMinimal extends StatefulWidget {

  final CardModel card;

  const VaccinationCardMinimal({Key? key,required this.card}) : super(key: key);

  @override
  State<VaccinationCardMinimal> createState() => _VaccinationCardMinimalState();
}

class _VaccinationCardMinimalState extends State<VaccinationCardMinimal> {

  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          bottom: 10,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(widget.card.color),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(_size.width, 210),
                      painter: ShapePainter(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: const [
                              SizedBox(height: 10,),
                              IconPharmacy(),
                              SizedBox(height: 10,),
                              Text(Strings.titleCard,style: TextStyles.titleCardStyle,),
                              Text(Strings.subtitleCard,style: TextStyles.subtitleCardStyle,),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]
              ),
            ),
          ),
        ),

        Positioned.fill(
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: BarCode(barcode: widget.card.barCode),
                ),
              ],
            )
        )

      ],
    );
  }
}


class BarCode extends StatelessWidget {
  final String? barcode;
  const BarCode({Key? key,this.barcode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(10),
        width: _size.width*0.35,
        height: 70,
        child: barcode!=null&&barcode!.isNotEmpty?BarcodeWidget(
          barcode: Barcode.code128(),
          data: barcode!,
        ):const SizedBox.shrink(),
      ),
    );
  }
}



class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    path.lineTo(0, size.height*0.6);
    path.quadraticBezierTo(size.width*0.5, size.height, size.width,  size.height*0.6);
    path.lineTo(size.width, 0);
    path.close();

    paint.color =Colors.white.withOpacity(0.1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
