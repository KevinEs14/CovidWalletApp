part of 'card_bloc.dart';
abstract class CardEvent extends Equatable{
  const CardEvent();

  @override
  List<Object?> get props => [];
}
class GetCardsEvent extends CardEvent{}
class EditCardEvent extends CardEvent{}
class NewCardEvent extends CardEvent{}

class RemoveCardEvent extends CardEvent{}

class SaveCardEvent extends CardEvent{
}
class ChangeCurrentCardEvent extends CardEvent{
  final String? fullName;
  final String? vaccine;
  final List<String>? doseDates;
  final int? color;
  final String? barCode;
  const ChangeCurrentCardEvent({this.fullName,this.vaccine,this.doseDates,this.color,this.barCode});


  @override
  List<Object?> get props => [fullName,vaccine,doseDates,color,barCode];
}

