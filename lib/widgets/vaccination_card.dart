import 'dart:async';
import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/theme/input_styles.dart';
import 'package:covid_wallet_app/theme/my_behavior.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:covid_wallet_app/ui/icons/icon_edit.dart';
import 'package:covid_wallet_app/ui/icons/icon_pharmacy.dart';
import 'package:covid_wallet_app/widgets/alerts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';

class VaccinationCard extends StatefulWidget {

  final CardModel card;
  final bool edit;

  const VaccinationCard({Key? key,required this.card,this.edit=false}) : super(key: key);

  @override
  State<VaccinationCard> createState() => _VaccinationCardState();
}

class _VaccinationCardState extends State<VaccinationCard> {

  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          bottom: 50,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                  color: colorCards[widget.card.color],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                    CustomPaint(
                      size: Size(_size.width, 210),
                      painter: ShapePainter(),
                    ),
                  Positioned.fill(
                        child: FormCard(card:widget.card,edit: widget.edit,),
                  ),
                  if(!widget.edit)...[
                    Positioned.fill(
                      child: Container(
                        color: Colors.transparent,
                      )
                    ),
                    const Positioned(
                        right: 10,
                        top: 10,
                        child: ActionButtons()
                    ),
                    ]
                ]
              ),
            ),
          ),
        ),

        Positioned.fill(
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: BarCode(barcode: widget.card.barCode),
              ),
            ],
          )
        )

      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
            onPressed: (){
              context.read<CardBloc>().add(EditCardEvent());
              Navigator.pushNamed(context, Routes.maker,arguments: BlocProvider.of<CardBloc>(context));
            },
            icon: const IconEdit(width: 30.0,color: colorTextSecondary)
        ),
        IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: (){
              _deleteCard(context);
            },
            icon: const Icon(Icons.delete,color: colorTextSecondary,size: 30,)
        )
      ],
    );
  }

  _deleteCard(BuildContext context)async{
    var res=await showRegularAlert(context: context, title: "Delete", subtitle: Strings.alertDeleteCard);
    if(res){
      context.read<CardBloc>().add(RemoveCardEvent());
    }
  }
}

class BarCode extends StatelessWidget {
  final String? barcode;
  const BarCode({Key? key,this.barcode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(10),
        width: _size.width*0.5,
        height: 100,
        child: barcode!=null&&barcode!.isNotEmpty?BarcodeWidget(
          barcode: Barcode.code128(),
          data: barcode!,
        ):const SizedBox.shrink(),
      ),
    );
  }
}

class FormCard extends StatefulWidget {

  const FormCard({Key? key,required this.card,this.edit = false}) : super(key: key);

  final CardModel card;
  final bool edit;

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {

  final TextEditingController _fullNameController=TextEditingController();
  final TextEditingController _vaccineController=TextEditingController();
  final List<TextEditingController> _dateController=[TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];

  final ScrollController _scrollController=ScrollController();

  @override
  void initState() {
    _loadData();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child:SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(20),
        child:Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const IconPharmacy(),
              const SizedBox(height: 10,),
              const Text(Strings.titleCard,style: TextStyles.titleCardStyle,),
              const Text(Strings.subtitleCard,style: TextStyles.subtitleCardStyle,),
              const SizedBox(height: 10,),
              const SizedBox(height: 10,),
              TextField(
                decoration: InputStyles.inputGeneral("","Full Name"),
                controller: _fullNameController,
                style: TextStyles.inputStyle,
                onChanged: (value){
                  context.read<CardBloc>().add(ChangeValuesCurrentCardEvent(fullName: value));
                },

              ),
              const SizedBox(height: 15,),
              TextField(
                decoration: InputStyles.inputGeneral("","Vaccine"),
                controller: _vaccineController,
                onChanged: (value){
                  context.read<CardBloc>().add(ChangeValuesCurrentCardEvent(vaccine: value));
                },

                style: TextStyles.inputStyle,
              ),
              const  SizedBox(height: 15,),
              Column(
                children: _getDatesWidgets(widget.card.doseDates),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(widget.edit&&widget.card.doseDates.length<6)...[
                    IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () async {
                          await _showDatePicker(context: context, controller: null,index:0);

                          SchedulerBinding.instance!.addPostFrameCallback((_) {
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          });
                        },
                        icon: const Icon(Icons.add_circle_outlined,size: 30,color: colorTextSecondary,)
                    ),
                  ],
                  if(widget.edit&&widget.card.doseDates.isNotEmpty)...[
                    IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: (){
                          setState(() {
                            widget.card.doseDates.removeLast();
                          });
                        },
                        icon: const Icon(Icons.remove_circle,size: 30,color: colorTextSecondary,)
                    ),

                  ],
                ],
              ),


              const SizedBox(height: 35,),
            ],
          )
      ),
    );
      }

   List<Widget> _getDatesWidgets(List<String> dates){
    List<Widget> list=[];
    List<Widget> listForm=[];
    for(int i=0;i<dates.length;i++){
      if(i%2==0){
        listForm=[];
      }
      listForm.add(
        Flexible(
          child: TextField(
            decoration: InputStyles.inputGeneral("","Date ${Strings.ordinalNumbers[i]} dose"),
            onTap: ()async{
              _showDatePicker(context: context,controller: _dateController[i],index:i);
            },
            controller: _dateController[i],
            keyboardType: TextInputType.datetime,
            readOnly: true,
            style: TextStyles.inputStyle,
          ),
        ),
      );
      if((i%2==0)&(dates.length%2==0||i+1!=dates.length)){
        listForm.add(const SizedBox(width: 10,));
      }
      if(i%2!=0){
        list.add(
            Row(
              mainAxisSize: MainAxisSize.min,
              children: listForm,)
        );
        list.add(const SizedBox(height: 15,));
        }
      }
    if(dates.length%2!=0){
      list.add(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: listForm,)
      );
    }
    return list;
   }

  Future<void> _showDatePicker({required BuildContext context,TextEditingController? controller,required int index})async{
    FocusScope.of(context).unfocus();
    DateTime initialDate=DateTime.now();
    if(controller!=null){
      var splitDate=controller.text.split("/");
      initialDate=DateTime(int.parse("20"+splitDate[2]),int.parse(splitDate[0]),int.parse(splitDate[1]));
    }
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2050));

    if (picked != null ){
      String date="${picked.month}/${picked.day}/${picked.year.toString().substring(2,4)}";
      if(controller==null){
        setState(() {
          _dateController[widget.card.doseDates.length].text=date;
          widget.card.doseDates.add(date);
        });
      }
      else{
        controller.text=date;
        widget.card.doseDates[index]=date;
      }
    }

  }
  _loadData(){
    CardModel card=widget.card;
    _fullNameController.text=card.fullName;
    _vaccineController.text=card.vaccine;
    for(int i=0;i<card.doseDates.length;i++){
      _dateController[i].text=card.doseDates[i];
    }
  }

}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    path.lineTo(0, size.height*0.6);
    path.quadraticBezierTo(size.width*0.5, size.height, size.width,  size.height*0.6);
    path.lineTo(size.width, 0);
    path.close();

    paint.color =Colors.white.withOpacity(0.1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
