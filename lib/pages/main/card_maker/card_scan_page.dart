import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/widgets/vaccination_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CardScanPage extends StatelessWidget {
  const CardScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return BlocBuilder<CardBloc,CardState>(
        builder: (context,state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                  child: Text(
                    "Scan Barcode",
                    style: TextStyles.titleCardStyle,
                  )),
              SizedBox(height: 10,),
              Center(
                  child: Text(
                    "Wait until your camera detects the \n Barcode information",
                    textAlign: TextAlign.center,
                    style: TextStyles.subtitleCardStyle,
                  )),
              SizedBox(height: 20,),
              /*RawMaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                fillColor: colorSecondary,
                onPressed: (){
                  // checkpermission_camera(context);
                  // print("init");
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 20),

                  width: _size.width*0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.qr_code,color: Colors.white,),
                      Text(
                        "Scan Barcode",
                        textAlign: TextAlign.center,
                        style: TextStyles.titleCardStyle,
                      )
                    ],
                  ),
                ),
              ),*/
            ],
          );
        }
    );
  }
}
