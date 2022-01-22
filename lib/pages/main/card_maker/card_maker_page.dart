import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/pages/main/card_maker/card_choose_color_page.dart';
import 'package:covid_wallet_app/pages/main/card_maker/card_form_page.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:covid_wallet_app/widgets/general_background.dart';
import 'package:covid_wallet_app/widgets/snack_bars.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardMakerPage extends StatefulWidget {
  final CardBloc cardBloc;
  const CardMakerPage({Key? key,required this.cardBloc}) : super(key: key);

  @override
  State<CardMakerPage> createState() => _CardMakerPageState();
}

class _CardMakerPageState extends State<CardMakerPage> {
  int _indexPage=0;
  final _pages=[CardChooseColorPage(),CardChooseColorPage(),CardFormPage()];
  final PageController _pageController=PageController();
  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>widget.cardBloc,
      child: BlocConsumer<CardBloc,CardState>(
          listener: (context,state)async{
            if(state is CardStateSaveOk){
              showSuccessSnackBar(context: context, text: "Card saved successfully");
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            }
            if(state is CardStateSaveError){
              showErrorSnackBar(context: context, text: state.error);
            }
          },
          builder: (context,state) {
          return GeneralBackground(
            opacityLogo: 0.3,
            title: state.currentCard.key==null?const Text(Strings.newCard,style: TextStyles.titleStyle,):const Text(Strings.editCard,style: TextStyles.titleStyle,),
            popFunction: ()async{
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              return false;
            },
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: DotsIndicator(height:10, index: _indexPage,color: colorTextPrimary,),
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
                            if(_indexPage>0)...[
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
                            _indexPage<_pages.length-1?MaterialButton(
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

