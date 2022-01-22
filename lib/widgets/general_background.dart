import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/ui/icons/icon_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralBackground extends StatelessWidget {
  final Widget child;
  final int height;
  final double opacityLogo;
  final Widget? title;
  final Widget? actionButton;
  final Widget? backgroundImage;
  final Color? iconColor;
  final Future<bool> Function()? popFunction;
  const GeneralBackground({Key? key,required this.child,this.iconColor,this.height=3,this.backgroundImage,this.opacityLogo=0,this.title,this.actionButton,this.popFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: popFunction ?? ()async{
        return true;
      },
      child: Scaffold(
        backgroundColor: colorOnBackground,
        floatingActionButton: actionButton,
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
            if(backgroundImage!=null)...[
                backgroundImage!,
            ],
            SingleChildScrollView(
              child: SizedBox(
                width: _size.width,
                height: _size.height,
                child: Column(
                  children: [
                    title!=null?
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              iconTheme: iconColor!=null?IconThemeData(color: iconColor):null,
                              centerTitle: true,
                              title: title,
                            ),

                          ],
                        )
                    ):const SizedBox.shrink(),
                    Expanded(
                        flex: 6,
                        child: child
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
