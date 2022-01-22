
import 'package:covid_wallet_app/bloc/settings/settings_state.dart';
import 'package:covid_wallet_app/repositories/settings_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState>{
  final SettingsRepository _settingsRepository;
  SettingsCubit(this._settingsRepository) : super(InitSettings());

  void getSettings()async {
    await _settingsRepository.verifyFirstTime();
    if(_settingsRepository.firstTime){
      emit(FirstTimeSettings());
    }
    else{
      emit(FoundSettings());
    }
  }
  void initSettings()async {
    await _settingsRepository.initSettings();
    emit(FirstTimeAddCard());
  }


  //DEVELOPER OPTIONS
  void clearSettings() async{
    await _settingsRepository.clearSettings();
    emit(FirstTimeSettings());
  }

}