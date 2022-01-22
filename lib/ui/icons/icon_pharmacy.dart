import 'package:covid_wallet_app/ui/icons/icon_bottle.dart';
import 'package:flutter/material.dart';

class IconPharmacy extends StatelessWidget {
  const IconPharmacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 70,
      width: 70,
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