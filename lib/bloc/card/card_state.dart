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
class CardStateEditingCard extends CardState{
  const CardStateEditingCard(cards,currentCard) : super(cards: cards,currentCard: currentCard);
}
class CardStateTransactionSuccess extends CardState{
  final String text;
  const CardStateTransactionSuccess(cards,currentCard,this.text) : super(cards: cards,currentCard: currentCard);
}

class CardStateTransactionError extends CardState{
  final String error;
  const CardStateTransactionError(cards,currentCard,this.error) : super(cards: cards,currentCard: currentCard);
}
