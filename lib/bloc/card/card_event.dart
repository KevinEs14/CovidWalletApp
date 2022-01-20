part of 'card_bloc.dart';
abstract class CardEvent extends Equatable{
  const CardEvent();

  @override
  List<Object> get props => [];
}
class GetCardsEvent extends CardEvent{}
class AddCardEvent extends CardEvent{
  final Card card;
  const AddCardEvent(this.card);

  @override
  List<Object> get props => [card];
}

class RemoveCardEvent extends CardEvent{
  final Card card;
  const RemoveCardEvent(this.card);
  @override
  List<Object> get props => [card];
}

class UpdateCardEvent extends CardEvent{
  final Card card;
  const UpdateCardEvent(this.card);

  @override
  List<Object> get props => [card];

}