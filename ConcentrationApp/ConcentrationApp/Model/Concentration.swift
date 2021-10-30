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
        
        for id in 0..<numberOfPairOfCards{
            let card = Card(id: id)
            cards.append(card)
            cards.append(card)
        }
    }
    
    
    func chooseCard(at index: Int){

    }
}



struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    init(id: Int){
        self.id = id
    }
}
