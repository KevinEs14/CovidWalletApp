import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/widgets/general_background.dart';
import 'package:covid_wallet_app/widgets/vaccination_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralBackground(
      title: "My Information",
      opacityLogo: 0.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50 ,horizontal: 20),
        child: VaccinationCard(),
      )
    );
  }
}
