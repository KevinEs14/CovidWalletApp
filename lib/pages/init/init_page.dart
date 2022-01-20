import 'package:covid_wallet_app/bloc/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitPage extends StatelessWidget {
  final SettingsCubit settingsCubit;
  const InitPage({Key? key,required this.settingsCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocProvider(
        create: (context)=>settingsCubit,
        child: Center(
          child: MaterialButton(
            onPressed: (){
              context.read<SettingsCubit>().initSettings();
              print("init");
            },
            child: Text("Init Page"),
          ),
        ),
      )
    );
  }
}
