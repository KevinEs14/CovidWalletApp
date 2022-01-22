import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/routes.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
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

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc,CardState>(
        builder: (context,state) {
          return GeneralBackground(
            title: const Text(Strings.home,style: TextStyles.titleStyle,),
            actionButton: FloatingActionButton(
              backgroundColor: colorPrimary,
              elevation: 5,

              onPressed: (){
                context.read<CardBloc>().add(NewCardEvent());
                Navigator.pushNamed(context, Routes.maker,arguments: BlocProvider.of<CardBloc>(context));
              },
              child: const Icon(Icons.add,color: colorTextSecondary,size: 50,),
            ),
            opacityLogo: 0.2,
            child: state is CardStateFoundCards?
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25 ,horizontal: 30),
                    child: VaccinationCard(card: state.currentCard,),
                  ):const SpinKitThreeBounce(
                    color: colorTextPrimary,
                    size: 50.0,
                  )
          );
        }
      );
  }
}
