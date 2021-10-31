//
//  Concentration.swift
//  ConcentrationApp
//
//  Created by Anton Veldanov on 10/30/21.
//

import Foundation


class Concentration{
    
    private(set) var cards = [Card]()
    
    private var indexOfOneCardUp: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices{
               if cards[index].isFaceUp{
                    if foundIndex == nil{
                       foundIndex = index
                    }else{
                       return nil
                    }
                }
            }
            return foundIndex
        }
        
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
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
            }else{
                // no or 2 cards are faceup
                indexOfOneCardUp = index
            }
        }
    }
}



struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    private static var idFactory = 0
    
    init(){
        self.id = Card.getUniqueId()
    }
    
    private static func getUniqueId()->Int{
        idFactory += 1
        return idFactory
    }
}
