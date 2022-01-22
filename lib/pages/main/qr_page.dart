import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:flutter/material.dart';
class QrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.transparent, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/scanBackground.png"),
                fit: BoxFit.cover,
                // colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                    "Scan Barcode",
                    style: TextStyle(
                        color: colorOnPrimary, fontSize: 34, fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 10,),
              Center(
                  child: Text(
                    "Wait until your camera detects the",
                    style: TextStyle(
                        color: colorOnPrimary, fontSize: 16, ),
                  )),
              Center(
                  child: Text(
                    "Barcode information",
                    style: TextStyle(
                        color: colorOnPrimary, fontSize: 16,),
                  )),
              SizedBox(height: 20,),
              RawMaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                fillColor: colorSecondary,
                onPressed: (){
                  // checkpermission_camera(context);
                  // print("init");
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 25),

                  width: size.width*0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.qr_code,color: Colors.white,),
                      const Text(
                        "Scan Barcode",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
