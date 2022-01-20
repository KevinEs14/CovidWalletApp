import 'package:hive/hive.dart';

part 'card.g.dart';
@HiveType(typeId: 0)
class Card{
  int? key;

  @HiveField(0)
  String fullName;

  @HiveField(1)
  String vaccine;

  @HiveField(2)
  List<String> doseDates;
  Card({required this.fullName, required this.vaccine, required this.doseDates});


}