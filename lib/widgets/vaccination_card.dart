import 'dart:async';

import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/theme/input_styles.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:covid_wallet_app/ui/icons/icon_bottle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class VaccinationCard extends StatefulWidget {

  const VaccinationCard({Key? key}) : super(key: key);

  @override
  State<VaccinationCard> createState() => _VaccinationCardState();
}

class _VaccinationCardState extends State<VaccinationCard> {


  late StreamSubscription<bool> keyboardSubscription;
  bool _barCodeActive=true;
  @override
  void dispose() {
    super.dispose();
    keyboardSubscription.cancel();
  }
  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
     if(!visible){
       setState(() {
         _barCodeActive=true;
       });
     }
     else{
       setState(() {
         _barCodeActive=false;
       });
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          bottom: 50,
          child: Container(
            decoration: BoxDecoration(
                color: colorCard1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                  CustomPaint(
                    size: Size(_size.width, 220),
                    painter: ShapePainter(),
                  ),
                Positioned.fill(

                      child: FormCard(),
                )
              ],
            ),
          ),
        ),

        Positioned.fill(
          bottom: 0,
          child: _barCodeActive?Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Center(
                child: BarCode(),
              ),
            ],
          ):SizedBox.shrink()
        )

      ],
    );
  }
}

class BarCode extends StatelessWidget {
  const BarCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        width: _size.width*0.5,
        height: 100,
      ),
    );
  }
}

class Icon extends StatelessWidget {
  const Icon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.white),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Center(
            child: IconBottle(width: 30,),
          )
      ),

    );
  }
}
class FormCard extends StatelessWidget {
  final TextEditingController fullNameController=TextEditingController();

  final TextEditingController vaccineController=TextEditingController();

  final TextEditingController date1Controller=TextEditingController();
  final TextEditingController date2Controller=TextEditingController();
  final TextEditingController date3Controller=TextEditingController();

  FormCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
          padding: EdgeInsets.all(20),

        child: Column(
          children: [
            const Icon(),
            const SizedBox(height: 10,),
            const Text(Strings.titleCard,style: TextStyles.titleCardStyle,),
            const Text(Strings.subtitleCard,style: TextStyles.subtitleCardStyle,),
            const SizedBox(height: 10,),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputStyles.inputGeneral("","Full Name"),
              controller: fullNameController,
              style: TextStyles.inputStyle,

            ),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputStyles.inputGeneral("","Vaccine"),
              style: TextStyles.inputStyle,
            ),
            const  SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: InputStyles.inputGeneral("","Date First dose"),
                    onTap: ()async{
                      _showDatePicker(context,date1Controller);
                    },
                    controller: date1Controller,
                    keyboardType: TextInputType.datetime,
                    readOnly: true,
                    style: TextStyles.inputStyle,
                  ),
                ),
                const SizedBox(width: 10,),
                Flexible(
                  child: TextFormField(
                    decoration: InputStyles.inputGeneral("","Date Second dose"),
                    style: TextStyles.inputStyle,
                    readOnly: true,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50,),
          ],
        )
      ),
    );
  }
  _showDatePicker(BuildContext context,TextEditingController controller)async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2020, 8),
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2050));
    if (picked != null ){
      debugPrint(picked.toString());
      controller.text="${picked.month}/${picked.day}/${picked.year}";
    }
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

    paint.color =Colors.white.withOpacity(0.25);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
