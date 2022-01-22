
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
    on<SaveCardEvent>(_onSaveCardEvent);
    on<RemoveCardEvent>(_onRemoveCardEvent);
    on<ChangeCurrentCardEvent>(_onChangeCurrentCardEvent);
    on<EditCardEvent>(_onEditCardEvent);
    on<NewCardEvent>(_onNewCardEvent);
  }

  void _onGetCardsEvent(GetCardsEvent event,Emitter<CardState> emit) async{
    await _cardRepository.getCards();
    emit(CardStateFoundCards(_cardRepository.cards,_cardRepository.currentCard));
  }
  void _onSaveCardEvent(SaveCardEvent event,Emitter<CardState> emit)async {
    try{
      emit(CardStateWaiting(_cardRepository.cards,_cardRepository.currentCard));
      await _cardRepository.saveCard();
      emit(CardStateSaveOk(_cardRepository.cards,_cardRepository.currentCard));
    }
    catch(e){
      emit(CardStateSaveError(_cardRepository.cards,_cardRepository.currentCard,e.toString()));
    }
  }
  void _onRemoveCardEvent(RemoveCardEvent event,Emitter<CardState> emit)async{
    try{
      emit(CardStateWaiting(_cardRepository.cards,_cardRepository.currentCard));
      await _cardRepository.removeCard();
      emit(CardStateFoundCards(_cardRepository.cards,_cardRepository.currentCard));
    }
    catch(_){}

  }

  void _onChangeCurrentCardEvent(ChangeCurrentCardEvent event,Emitter<CardState> emit)async{
    try{
      var previousState=state;
      emit(CardStateWaiting(_cardRepository.cards,_cardRepository.currentCard));
      _cardRepository.currentCard=
          _cardRepository.currentCard.copyWith(
              fullName: event.fullName,
              color: event.color,
              vaccine: event.vaccine,
              doseDates: event.doseDates,
              barCode: event.barCode
          );
      if(previousState is CardStateFoundCards){
        emit(CardStateFoundCards(_cardRepository.cards,_cardRepository.currentCard));
      }
      else{
        emit(CardStateEditingCard(_cardRepository.cards,_cardRepository.currentCard));
      }
    }
    catch(_){}
  }
  void _onEditCardEvent(EditCardEvent event, Emitter<CardState> emit) async{
    emit(CardStateEditingCard(_cardRepository.cards,_cardRepository.currentCard));
  }
  void _onNewCardEvent(NewCardEvent event, Emitter<CardState> emit) async{
    _cardRepository.currentCard=CardModel.init();
    emit(CardStateEditingCard(_cardRepository.cards,_cardRepository.currentCard));
  }

}