import 'package:covid_wallet_app/models/card.dart';
import 'package:hive/hive.dart';

class CardRepository{
  List<CardModel> cards=[];
  CardModel currentCard=CardModel.init();

  Future<void> getCards()async {
    try{
      cards=[];
      var boxCards = await Hive.openBox<CardModel>('cards');
      for(var key in boxCards.keys){
        CardModel? card=boxCards.get(key);
        if(card!=null){
          card.key=key;
          cards.add(card);
        }
      }
      if(cards.isNotEmpty){
        currentCard=cards.first;
      }
      boxCards.close();
    }
    catch(_){
      throw "Could not get cards";
    }

  }
  Future<void> saveCard()async{
    try{
      currentCard.verifyData();
      await Future.delayed(const Duration(milliseconds: 1000));
      var boxCards = await Hive.openBox<CardModel>('cards');
      if(currentCard.key==null){

        await boxCards.add(currentCard);
      }
      else{
        await boxCards.put(currentCard.key,currentCard);
      }
      boxCards.close();
    }
    catch(e){
      rethrow;
    }
  }
  Future<void> removeCard()async{
    try{
      var boxCards = await Hive.openBox<CardModel>('cards');
      await boxCards.delete(currentCard.key);
      boxCards.close();
    }
    catch(_){
      throw "Could not remove card";
    }
  }
}