//
//  Concentration.swift
//  ConcentrationApp
//
//  Created by Anton Veldanov on 10/30/21.
//

import Foundation


class Concentration{
    
    var cards = [Card]()
    
    init(numberOfPairOfCards: Int){
        
        for _ in 0..<numberOfPairOfCards{
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        
        //TODO Shuffle Cards
    }
    
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        }else{
            cards[index].isFaceUp = true
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
