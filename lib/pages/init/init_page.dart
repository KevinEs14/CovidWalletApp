import 'package:covid_wallet_app/bloc/settings/settings_cubit.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class InitPage extends StatelessWidget {
  final SettingsCubit settingsCubit;
  // bool permission=false;
  const InitPage({Key? key,required this.settingsCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:BlocProvider(
        create: (context)=>settingsCubit,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/phoneScanner.png",),

            Text(Strings.initWelcome,style: TextStyles.titleStyle,),
            Container(
                height: size.height*0.08,
                width: size.width*0.35,
                child: Image.asset("assets/permission.png",)
            ),
              SizedBox(height: 10,),
              Center(
                  child: Text(
                    Strings.initInstructions,
                    textAlign: TextAlign.center,
                    style: TextStyles.commentsStyle,)
              ),
            // Center(
            //   child: Text("we can scan and provide you what is",style: TextStyle(fontSize: 15),),
            // ),
            // Center(
            //   child: Text("the inside the code",style: TextStyle(fontSize: 15),),
            // ),
            SizedBox(height: 20,),

            SizedBox(height: 20,),
            RawMaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                fillColor: colorPrimary,
                onPressed: (){
                  checkpermission_camera(context);
                  // print("init");
                },
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 25),

                width: size.width*0.8,
                child: const Text(
                  Strings.initButton,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ),
          ],
        ),
      )
    );
  }
}

 checkpermission_camera(BuildContext context)async{
  var cameraStatus= await Permission.camera.status;

  if(!cameraStatus.isGranted){
    var permission=await Permission.camera.request();

  }
  if(await Permission.camera.isGranted){
    context.read<SettingsCubit>().initSettings();
  }
}