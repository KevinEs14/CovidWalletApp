import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:hive/hive.dart';

part 'card.g.dart';
@HiveType(typeId: 0)
class CardModel{

  int? key;

  @HiveField(0)
  String fullName;

  @HiveField(1)
  String vaccine;

  @HiveField(2)
  List<String> doseDates;


  @HiveField(3)
  int color;

  @HiveField(4)
  String barCode;

  CardModel({this.key,required this.fullName, required this.vaccine, required this.doseDates,required this.color,required this.barCode});

  CardModel.init():
      key=null,
      fullName="",
      vaccine="",
      doseDates=[],
      color=0,
      barCode="";

  CardModel copyWith({String? fullName, String? vaccine, List<String>? doseDates,int? color,String? barCode}) =>
      CardModel(key: key,fullName: fullName??this.fullName, vaccine: vaccine??this.vaccine, doseDates: doseDates??this.doseDates, color: color??this.color, barCode: barCode??this.barCode);

  @override
  String toString() {
    return 'CardModel{key: $key, fullName: $fullName, vaccine: $vaccine, doseDates: $doseDates, color: $color, barCode: $barCode}';
  }

  verifyData(){
    if(fullName.isEmpty){
      throw Strings.errorEmptyFullName;
    }
    if(vaccine.isEmpty){
      throw Strings.errorEmptyVaccine;
    }
    if(doseDates.isEmpty){
      throw Strings.errorEmptyDoses;
    }
  }
}