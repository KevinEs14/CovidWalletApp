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

  CardModel({required this.fullName, required this.vaccine, required this.doseDates,required this.color,required this.barCode});


}