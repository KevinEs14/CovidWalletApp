part of 'card_bloc.dart';

class CardState extends Equatable {

  final List<CardModel> cards;

  const CardState({
    required this.cards});

  const CardState.init(this.cards);

  const CardState.foundCards(this.cards);

  const CardState.waiting(this.cards);

  @override
  List<Object> get props => [cards];
}