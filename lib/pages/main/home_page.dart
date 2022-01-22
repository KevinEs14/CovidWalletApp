import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/routes.dart';
import 'package:covid_wallet_app/theme/my_behavior.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:covid_wallet_app/widgets/alerts.dart';
import 'package:covid_wallet_app/widgets/general_background.dart';
import 'package:covid_wallet_app/widgets/snack_bars.dart';
import 'package:covid_wallet_app/widgets/vaccination_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  PageController _pageController=PageController();
  int _indexCard=0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardBloc,CardState>(
        listener: (context,state){
          if(state is CardStateFoundCards){
            SchedulerBinding.instance!.addPostFrameCallback((_) {
              _pageController=PageController(initialPage: _indexCard);
            });
          }
          if(state is CardStateTransactionSuccess){
            showSuccessSnackBar(context: context, text: state.text);
            context.read<CardBloc>().add(GetCardsEvent());
          }
          if(state is CardStateTransactionError){
            showErrorSnackBar(context: context, text: state.error);
          }
        },
        builder: (context,state) {
          return GeneralBackground(
            title: const Text(Strings.home,style: TextStyles.titleStyle,),
            actionButton: state.cards.isEmpty?null:FloatingActionButton(
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
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                          child: Text(state.cards.length<=1?"":" ${_indexCard+1} of ${state.cards.length} ",style: TextStyles.indicatorStyle)
                      ),
                      Expanded(
                        flex: 40,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ScrollConfiguration(
                                behavior: MyBehavior(),
                                child: PageView(
                                  controller: _pageController,
                                  onPageChanged: (page){
                                    setState(() {
                                      _indexCard=page;
                                    });
                                    context.read<CardBloc>().add(ChangeCurrentCardEvent( card: state.cards[page]));
                                  },
                                  children: _buildCards(state.cards)
                                ),
                              ),
                            ),

                            Positioned.fill(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimatedOpacity(
                                    opacity: _indexCard>0?1:0,
                                      duration: const Duration(milliseconds: 200),
                                      child: const Icon(Icons.navigate_before,color: colorTextPrimary),
                                  ),
                                  AnimatedOpacity(
                                      opacity: _indexCard<state.cards.length-1?1:0,
                                      duration: const Duration(milliseconds: 200),
                                      child: const Icon(Icons.navigate_next,color: colorTextPrimary,)
                                  )
                                ],
                              )
                            ),
                            if(state.cards.isEmpty)...[
                              Positioned.fill(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(Strings.noCardsFound,style: TextStyles.commentsStyle,textAlign: TextAlign.center,),
                                    const SizedBox(height: 20,),
                                    FloatingActionButton(
                                      backgroundColor: colorPrimary,
                                      elevation: 5,

                                      onPressed: (){
                                        context.read<CardBloc>().add(NewCardEvent());
                                        Navigator.pushNamed(context, Routes.maker,arguments: BlocProvider.of<CardBloc>(context));
                                      },
                                      child: const Icon(Icons.add,color: colorTextSecondary,size: 50,),
                                    ),
                                  ],
                                ),
                              )
                            ]

                          ],
                        )
                      ),
                    ],
                  )

                :state is CardStateWaiting?const SpinKitFadingCircle(
              color: colorTextPrimary,
            ): const SizedBox.shrink(),
          );
        }
      );
  }
  List<Widget> _buildCards(List<CardModel> cards){
    List<Widget> cardList=[];
    for(var card in cards){
      cardList.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 25,left: 20,right: 20),
            child: VaccinationCard(card: card,),
          ),
      );
    }
    return cardList;
  }
}
