import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/pages/main/card_maker/choose_color.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:covid_wallet_app/widgets/general_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardMakerPage extends StatelessWidget {
  final CardBloc cardBloc;
  const CardMakerPage({Key? key,required this.cardBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>cardBloc,
      child: BlocBuilder<CardBloc,CardState>(
          builder: (context,state) {
          return GeneralBackground(
            title: state is CardStateNewCard?const Text(Strings.newCard,style: TextStyles.titleStyle,):const Text(Strings.editCard,style: TextStyles.titleStyle,),
            popFunction: ()async{
              print("hola");
              return false;
            },
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: DotsIndicator(height:10, index: 1,color: colorTextPrimary,),
                ),
                const Expanded(
                  flex: 10,
                  child: ChooseColor()
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                      ],
                    )
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
class DotsIndicator extends StatelessWidget {
  final double height;
  final int index;
  final Color color;
  const DotsIndicator({Key? key,required this.height,required this.index,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _dots=[];
    for(int i=0;i<3;i++){
      _dots.add(Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(height),color: index==i?color:color.withOpacity(0.5),),height:height,width: height,margin: EdgeInsets.symmetric(horizontal: height*0.5),));
    }
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _dots
      );
  }
}

