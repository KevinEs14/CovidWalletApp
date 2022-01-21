import 'package:hive/hive.dart';

class SettingsRepository{
  bool firstTime=true;

  Future<void> verifyFirstTime()async{
    //time for splash screen
    await Future.delayed(const Duration(seconds: 2));

    var settings= await Hive.openBox<bool>('settings');
    bool? setting=settings.get("firstTime");
    if(setting!=null){
      firstTime=false;
    }
    settings.close();
  }
  Future<void> initSettings()async{
    var settings= await Hive.openBox<bool>('settings');
    await settings.put("firstTime", true);
    firstTime=false;
    settings.close();
  }

  Future<void> clearSettings()async{

    var settings= await Hive.openBox<bool>('settings');
    await settings.clear();
    settings.close();
  }
}