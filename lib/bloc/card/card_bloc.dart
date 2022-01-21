
import 'package:bloc/bloc.dart';
import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/repositories/card_repository.dart';
import 'package:equatable/equatable.dart';
part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent,CardState>{
  final CardRepository _cardRepository;
  CardBloc(this._cardRepository) : super(CardStateInit(_cardRepository.cards,_cardRepository.currentCard)){
    on<GetCardsEvent>(_onGetCardsEvent);
    on<AddCardEvent>(_onAddCardEvent);
    on<RemoveCardEvent>(_onRemoveCardEvent);
    on<UpdateCardEvent>(_onUpdateCardEvent);
    on<ChangeCurrentCardEvent>(_onChangeCurrentCardEvent);
  }

  void _onGetCardsEvent(GetCardsEvent event,Emitter<CardState> emit) async{
    await _cardRepository.getCards();
    emit(CardStateFoundCards(_cardRepository.cards,_cardRepository.currentCard));
  }
  void _onAddCardEvent(AddCardEvent event,Emitter<CardState> emit)async {
    try{
      emit(CardStateWaiting(_cardRepository.cards,_cardRepository.currentCard));
      await _cardRepository.addCard(event.card);
      emit(CardStateFoundCards(_cardRepository.cards,_cardRepository.currentCard));
    }
    catch(_){}
  }
  void _onRemoveCardEvent(RemoveCardEvent event,Emitter<CardState> emit)async{
    try{
      emit(CardStateWaiting(_cardRepository.cards,_cardRepository.currentCard));
      await _cardRepository.removeCard(event.card);
      emit(CardStateFoundCards(_cardRepository.cards,_cardRepository.currentCard));
    }
    catch(_){}

  }

  void _onUpdateCardEvent(UpdateCardEvent event,Emitter<CardState> emit)async{
    try{
      emit(CardStateWaiting(_cardRepository.cards,_cardRepository.currentCard));
      await _cardRepository.updateCard(event.card);
      emit(CardStateFoundCards(_cardRepository.cards,_cardRepository.currentCard));
    }
    catch(_){}

  }
  void _onChangeCurrentCardEvent(ChangeCurrentCardEvent event,Emitter<CardState> emit)async{
    try{
      emit(CardStateWaiting(_cardRepository.cards,_cardRepository.currentCard));
      _cardRepository.currentCard=
          _cardRepository.currentCard.copyWith(
              fullName: event.fullName,
              color: event.color,
              vaccine: event.vaccine,
              doseDates: event.doseDates,
              barCode: event.barCode
          );
      emit(CardStateFoundCards(_cardRepository.cards,_cardRepository.currentCard));
    }
    catch(_){}
  }
}