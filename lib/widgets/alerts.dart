import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:flutter/material.dart';

class GeneralAlert extends StatelessWidget {
  final String title;
  final String subtitle;
  const GeneralAlert({Key? key,required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      title: Text(title,style: TextStyles.titleStyle,),
      content: Text(subtitle,style: TextStyles.commentsStyle,),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context,true);
          }, child: Text("Accept",style: TextStyles.textSuccessStyle,)),
        TextButton(onPressed: (){
          Navigator.pop(context,false);
        }, child: Text("Cancel",style: TextStyles.textErrorStyle,)),
      ],
    );
  }
}
Future<dynamic> showRegularAlert({
  required BuildContext context,
  required String title,
  required String subtitle
}) {
  return showDialog(context: context,  builder: (context)=>GeneralAlert(title: title, subtitle: subtitle));
}
