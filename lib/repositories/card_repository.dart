import 'package:covid_wallet_app/models/card.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CardRepository{
  List<CardModel> cards=[];
  CardModel currentCard=CardModel.init();

  Future<void> getCards()async {
    try{
      cards=[];
      var boxCards = await Hive.openBox<CardModel>('cards');
      await boxCards.clear();
      await boxCards.add(CardModel(fullName: "Alvin Jamil Poma Tarqui", vaccine: "Moderna Covid-19 Vaccine", doseDates: ["3/4/22","5/4/22","3/4/22"], color: 0xffEB9522, barCode: "3asdf122"));

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
  Future<void> addCard(CardModel card)async{
    try{
      var boxCards = await Hive.openBox<CardModel>('cards');
      await boxCards.add(card);
      boxCards.close();
    }
    catch(_){
      throw "Could not add card";
    }
  }
  Future<void> removeCard(CardModel card)async{
    try{
      var boxCards = await Hive.openBox<CardModel>('cards');
      await boxCards.delete(card.key);
      boxCards.close();
    }
    catch(_){
      throw "Could not remove card";
    }
  }
  Future<void> updateCard(CardModel card)async{
    try{
      var boxCards = await Hive.openBox<CardModel>('cards');
      await boxCards.put(card.key,card);
      boxCards.close();
    }
    catch(_){
      throw "Could not update card";
    }
  }
}