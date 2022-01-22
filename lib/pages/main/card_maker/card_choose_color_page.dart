import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/widgets/vaccination_card_minimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardChooseColorPage extends StatelessWidget {
  const CardChooseColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc,CardState>(
        builder: (context,state) {
        return Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                child: VaccinationCardMinimal(card: state.currentCard),
              )
            ),
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Choose the color",style: TextStyles.commentsStyle,),
                    const SizedBox(height: 10,),
                    ButtonColors(color:state.currentCard.color)
                  ],
                )
            ),
          ],
        );
      }
    );
  }
}
class ButtonColors extends StatefulWidget {
  final int color;
  const ButtonColors({Key? key,required this.color}) : super(key: key);

  @override
  State<ButtonColors> createState() => _ButtonColorsState();
}


class _ButtonColorsState extends State<ButtonColors> {
  var size=const Size(1,1);

  int active=0;
  @override
  void initState() {
    super.initState();
    setState(() {
      active=widget.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _buildButtons(),
      ),
    );
  }

  List<Widget> _buildButtons(){
    List<Widget> buttons=[];
    for(int i=0;i<colorCards.length;i++){
      buttons.add(
        GestureDetector(
          onTap: (){
            setState(() {
              active=i;
            });
            context.read<CardBloc>().add(ChangeValuesCurrentCardEvent(color: i));
          },
          child: Container(
            decoration: BoxDecoration(
              color:colorCards[i],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: active==i?Colors.white:Colors.transparent,width: 2),
              boxShadow: [
                if(active==i)...[
                  BoxShadow(
                      color: colorPrimary.withOpacity(0.5),
                      blurRadius: 7,
                      spreadRadius: 2,
                      offset: const Offset(0,2)
                  )
                ]
              ]
            ),
            width: size.width*0.13,
            height: size.width*0.13,
          ),

        )
      );
    }
    return buttons;
  }
}
