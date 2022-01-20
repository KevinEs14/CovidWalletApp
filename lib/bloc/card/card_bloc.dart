
import 'package:bloc/bloc.dart';
import 'package:covid_wallet_app/models/card.dart';
import 'package:covid_wallet_app/repositories/card_repository.dart';
import 'package:equatable/equatable.dart';
part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent,CardState>{
  final CardRepository _cardRepository;
  CardBloc(this._cardRepository) : super(CardState.init(_cardRepository.cards)){
    on<GetCardsEvent>(_onGetCardsEvent);
    on<AddCardEvent>(_onAddCardEvent);
    on<RemoveCardEvent>(_onRemoveCardEvent);
    on<UpdateCardEvent>(_onUpdateCardEvent);
  }

  void _onGetCardsEvent(GetCardsEvent event,Emitter<CardState> emit) async{
    await _cardRepository.getCards();
    emit(CardState.foundCards(_cardRepository.cards));
  }
  void _onAddCardEvent(AddCardEvent event,Emitter<CardState> emit)async {
    try{
      emit(CardState.waiting(_cardRepository.cards));
      await _cardRepository.addCard(event.card);
      emit(CardState.waiting(_cardRepository.cards));
    }
    catch(_){}
  }
  void _onRemoveCardEvent(RemoveCardEvent event,Emitter<CardState> emit)async{
    try{
      emit(CardState.waiting(_cardRepository.cards));
      await _cardRepository.removeCard(event.card);
      emit(CardState.waiting(_cardRepository.cards));
    }
    catch(_){}

  }

  void _onUpdateCardEvent(UpdateCardEvent event,Emitter<CardState> emit)async{
    try{
      emit(CardState.waiting(_cardRepository.cards));
      await _cardRepository.updateCard(event.card);
      emit(CardState.waiting(_cardRepository.cards));
    }
    catch(_){}

  }
}