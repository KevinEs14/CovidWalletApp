import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/bloc/settings/settings_cubit.dart';
import 'package:covid_wallet_app/bloc/settings/settings_state.dart';
import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/pages/init/init_page.dart';
import 'package:covid_wallet_app/pages/init/splash_page.dart';
import 'package:covid_wallet_app/pages/main/card_maker/card_maker_page.dart';
import 'package:covid_wallet_app/pages/main/home_page.dart';
import 'package:covid_wallet_app/pages/main/qr_page.dart';
import 'package:covid_wallet_app/repositories/card_repository.dart';
import 'package:covid_wallet_app/repositories/settings_repository.dart';
import 'package:covid_wallet_app/routes.dart';
import 'package:covid_wallet_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  Hive.registerAdapter(CardModelAdapter());
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SettingsRepository>(create: (context)=>SettingsRepository()),
        RepositoryProvider<CardRepository>(create: (context)=>CardRepository())
      ],
      child: BlocProvider(
          create: (context) => SettingsCubit(context.read<SettingsRepository>())..getSettings(),
          child: const Main()
      ),
    );
  }
}
class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: buildTheme(),
        navigatorKey: _navigatorKey,
        initialRoute: Routes.splash,
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.splash:(context)=>const SplashPage(),
          Routes.home:(context)=>BlocProvider(create: (context)=>CardBloc(context.read<CardRepository>())..add(GetCardsEvent()),child: const HomePage(),),
          //Routes.home:(context)=>BlocProvider(create: (context)=>CardBloc(context.read<CardRepository>())..add(GetCardsEvent()),child: QrPage(),),
          Routes.maker:(context)=>CardMakerPage(cardBloc: ModalRoute.of(context)!.settings.arguments as CardBloc),
          Routes.initPage:(context)=> InitPage(settingsCubit:BlocProvider.of<SettingsCubit>(context)),
        },
        builder: (context,child){
          return BlocListener<SettingsCubit,SettingsState>(
            listener: (context,state){
              if(state is FirstTimeSettings){
                _navigator!.pushNamedAndRemoveUntil(Routes.initPage, (route) => false);
              }
              else if(state is FoundSettings){
                _navigator!.pushNamedAndRemoveUntil(Routes.home, (route) => false);
              }
            },
            child: child,
          );
        },
      );
  }
}


