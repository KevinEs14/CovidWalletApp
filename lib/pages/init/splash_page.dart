import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/widgets/general_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralBackground(
      height: 10,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/imagotype.png",fit: BoxFit.contain,),
            ],
          )
        )
      ),
    );
  }
}
