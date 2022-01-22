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
class ChangeValuesCurrentCardEvent extends CardEvent{
  final String? fullName;
  final String? vaccine;
  final List<String>? doseDates;
  final int? color;
  final String? barCode;
  const ChangeValuesCurrentCardEvent({this.fullName,this.vaccine,this.doseDates,this.color,this.barCode});


  @override
  List<Object?> get props => [fullName,vaccine,doseDates,color,barCode];
}
class ChangeCurrentCardEvent extends CardEvent{
  final CardModel card;
  const ChangeCurrentCardEvent({required this.card});
  @override
  List<Object?> get props => [card];
}
