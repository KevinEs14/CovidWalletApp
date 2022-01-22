part of 'card_bloc.dart';

abstract class CardState extends Equatable {

  final List<CardModel> cards;
  final CardModel currentCard;

  const CardState({
    required this.cards,
    required this.currentCard
  });

  @override
  List<Object?> get props => [cards,currentCard];
}
class CardStateInit extends CardState{
  const CardStateInit(cards,currentCard) : super(cards: cards,currentCard: currentCard);
}
class CardStateFoundCards extends CardState{
  const CardStateFoundCards(cards,currentCard) : super(cards: cards,currentCard: currentCard);
}
class CardStateWaiting extends CardState{
  const CardStateWaiting(cards,currentCard) : super(cards: cards,currentCard: currentCard);
}
class CardStateEditCard extends CardState{
  const CardStateEditCard(cards,currentCard) : super(cards: cards,currentCard: currentCard);
}
class CardStateNewCard extends CardState{
  const CardStateNewCard(cards,currentCard) : super(cards: cards,currentCard: currentCard);
}