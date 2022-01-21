import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/ui/icons/icon_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralBackground extends StatelessWidget {
  final Widget child;
  final int height;
  final double opacityLogo;
  final String? title;
  const GeneralBackground({Key? key,required this.child,this.height=3,this.opacityLogo=0,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOnBackground,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: height,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(colors: [
                        colorOnBackground,
                        colorBackground
                      ])
                    )
                  )
              ),
              height>=10?SizedBox.shrink():
              Expanded(
                  flex: 10-height,
                child: Stack(
                  children: [
                    Positioned(
                        child: Image.asset("assets/isotype.png",fit: BoxFit.contain,width: 300,color: colorPrimary.withOpacity(opacityLogo),),
                      bottom: 50,
                      right: 0,
                    )
                  ],
                )
              )
            ],
          ),
          Column(
            children: [
              title!=null?
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        centerTitle: true,
                        title: title!=null?Text(title!,style: TextStyles.titleStyle,):null,
                      ),

                    ],
                  )
                ):const SizedBox.shrink(),
              Expanded(
                flex: 10,
                  child: child
              )
            ],
          )
        ],
      ),
    );
  }
}
