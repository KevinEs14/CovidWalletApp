import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/pages/main/card_maker/card_choose_color_page.dart';
import 'package:covid_wallet_app/pages/main/card_maker/card_form_page.dart';
import 'package:covid_wallet_app/pages/main/card_maker/card_scan_page.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:covid_wallet_app/widgets/general_background.dart';
import 'package:covid_wallet_app/widgets/snack_bars.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardMakerPage extends StatefulWidget {
  final int initialPage;
  const CardMakerPage({Key? key,required this.initialPage}) : super(key: key);

  @override
  State<CardMakerPage> createState() => _CardMakerPageState();
}

class _CardMakerPageState extends State<CardMakerPage> {
  int _indexPage=1;
  final _pages=[CardScanPage(),CardChooseColorPage(),CardFormPage()];
  PageController _pageController=PageController();
  @override
  void initState() {
    _indexPage=widget.initialPage;
    _pageController=PageController(initialPage: widget.initialPage);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return BlocConsumer<CardBloc,CardState>(
        listener: (context,state)async{

          if(state is CardStateTransactionSuccess){
            Navigator.pop(context);
          }
        },
        builder: (context,state) {
        return GeneralBackground(
          opacityLogo: 0.3,
          iconColor: _indexPage==0?colorTextSecondary:null,
          backgroundImage:_indexPage==0?Image.asset("assets/scanBackground.png",fit: BoxFit.fill,width: _size.width,height: _size.height,):null,
          title: Text(state.currentCard.key==null?Strings.newCard:Strings.editCard,style: _indexPage!=0?TextStyles.titleStyle:TextStyles.titleSecondStyle,),
          popFunction: ()async{
            context.read<CardBloc>().add(GetCardsEvent());
            return true;
          },
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: DotsIndicator(height:10, index: _indexPage,color: _indexPage==0?colorTextSecondary:colorTextPrimary,),
              ),
              Expanded(
                flex: 10,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: _pages,
                  controller: _pageController,
                )
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if(_indexPage==1)...[
                          TextButton(
                              onPressed: (){
                                _pageController.animateToPage(_indexPage-1, duration: const Duration(milliseconds: 200), curve: Curves.ease);
                                setState(() {
                                  _indexPage--;
                                });
                              },

                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: _size.width*0.3,
                                ),
                                child: const Center(
                                  child: Text("QR",style: TextStyles.textButtonStyle,),
                                )
                              )
                            )],

                          if(_indexPage>1)...[
                            TextButton(
                                onPressed: (){
                                  _pageController.animateToPage(_indexPage-1, duration: const Duration(milliseconds: 200), curve: Curves.ease);
                                  setState(() {
                                    _indexPage--;
                                  });
                                },

                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: _size.width*0.3,
                                    ),
                                    child: const Center(
                                      child: Text("Back",style: TextStyles.textButtonStyle,),
                                    )
                                )
                            )],
                          _indexPage<_pages.length-1&&state.currentCard.barCode.isNotEmpty?MaterialButton(
                              onPressed: (){
                                _pageController.animateToPage(_indexPage+1, duration: const Duration(milliseconds: 200), curve: Curves.ease);
                                setState(() {
                                  _indexPage++;
                                });
                              },
                              color: colorPrimary,
                              minWidth: _size.width*0.3,
                              child: const Text("Next",style: TextStyles.textButtonFillStyle,),
                            ):
                          _indexPage==_pages.length-1?
                            MaterialButton(
                              onPressed: (){
                                context.read<CardBloc>().add(SaveCardEvent());
                                showLoadingSnackBar(context: context, text: "Saving vaccination card");
                              },
                              color: colorPrimary,
                              minWidth: _size.width*0.3,
                              child: const Text("Save",style: TextStyles.textButtonFillStyle,),
                            ):const SizedBox.shrink(),
                        ],
                      )
                    ],
                  )
              ),
            ],
          ),
        );
      }
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

