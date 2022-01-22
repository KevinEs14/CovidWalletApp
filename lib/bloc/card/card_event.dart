part of 'card_bloc.dart';
abstract class CardEvent extends Equatable{
  const CardEvent();

  @override
  List<Object?> get props => [];
}
class GetCardsEvent extends CardEvent{}
class AddCardEvent extends CardEvent{
  final CardModel card;
  const AddCardEvent(this.card);

  @override
  List<Object> get props => [card];
}

class RemoveCardEvent extends CardEvent{
  final CardModel card;
  const RemoveCardEvent(this.card);
  @override
  List<Object> get props => [card];
}

class UpdateCardEvent extends CardEvent{
  final CardModel card;
  const UpdateCardEvent(this.card);

  @override
  List<Object> get props => [card];

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

class NewCardEvent extends CardEvent{}