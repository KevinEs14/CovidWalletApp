import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/widgets/general_background.dart';
import 'package:covid_wallet_app/widgets/vaccination_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GeneralBackground(
      title: "My Information",
      actionButton: FloatingActionButton(
        backgroundColor: colorPrimary,
        elevation: 5,

        onPressed: (){},
        child: const Icon(Icons.add,color: colorTextSecondary,size: 50,),
      ),
      opacityLogo: 0.2,
      child: BlocBuilder<CardBloc,CardState>(
        builder: (context,state) {
          if(state is CardStateFoundCards){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30 ,horizontal: 30),
              child: VaccinationCard(card: state.currentCard,),
            );
          }
          else{
            return SpinKitThreeBounce(
              color: colorTextPrimary,
              size: 50.0,
              controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 100)),
            );
          }
        }
      )
    );
  }
}
