//
//  Concentration.swift
//  ConcentrationApp
//
//  Created by Anton Veldanov on 10/30/21.
//

import Foundation


class Concentration{
    
    var cards = [Card]()
    
    var indexOfOneCardUp: Int?
    
    init(numberOfPairOfCards: Int){
        for _ in 0..<numberOfPairOfCards{
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        //Shuffle Cards (indexes)
        cards.shuffle()
    }
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            //make sure not to click the same card
            if let matchIndex = indexOfOneCardUp, matchIndex != index{
                // check if card match
                if cards[matchIndex].id == cards[index].id{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneCardUp = nil
                
            }else{
                // no or 2 cards are faceup
                
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneCardUp = index
            }
        }
    }
}



struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    static var idFactory = 0
    
    init(){
        self.id = Card.getUniqueId()
    }
    
    static func getUniqueId()->Int{
        idFactory += 1
        return idFactory
    }
}
