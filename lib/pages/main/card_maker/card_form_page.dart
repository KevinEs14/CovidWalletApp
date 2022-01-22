import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/widgets/vaccination_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CardFormPage extends StatelessWidget {
  const CardFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc,CardState>(
        builder: (context,state) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 25 ,horizontal: 30),
              child: VaccinationCard(card: state.currentCard,edit: true,),
          );
        }
    );
  }
}
