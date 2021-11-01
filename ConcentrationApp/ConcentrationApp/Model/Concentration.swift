//
//  Concentration.swift
//  ConcentrationApp
//
//  Created by Anton Veldanov on 10/30/21.
//

import Foundation


struct Concentration{
    
    private(set) var cards = [Card]()
    
    private var indexOfOneCardUp: Int?{
        get{
            
            //3
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
            
          //2
//            let faceUpCardIndecies = cards.indices.filter{cards[$0].isFaceUp}
//            return faceUpCardIndecies.count == 1 ? faceUpCardIndecies.first : nil
            
            
            //1
//            var foundIndex: Int?
//            for index in cards.indices{
//               if cards[index].isFaceUp{
//                    if foundIndex == nil{
//                       foundIndex = index
//                    }else{
//                       return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairOfCards: Int){
        assert(numberOfPairOfCards > 0,"[Concentration.init] \(numberOfPairOfCards): numberOfPairOfCards is not valid" )

        for _ in 0..<numberOfPairOfCards{
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        //Shuffle Cards (indexes)
        cards.shuffle()
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index),"[Concentration.chooseCard] \(index): chosen index is not in the cards" )
        if !cards[index].isMatched{
            //make sure not to click the same card
            if let matchIndex = indexOfOneCardUp, matchIndex != index{
                // check if card match
                if cards[matchIndex] == cards[index]{
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



struct Card: Hashable {
    
    var hashValue: Int {
        return id
    }
    
    static func == (lhs: Card, rhs: Card)->Bool{
        return lhs.id == rhs.id
    }
    
    
    
    var isFaceUp = false
    var isMatched = false
    private var id: Int
    
    private static var idFactory = 0
    
    init(){
        self.id = Card.getUniqueId()
    }
    
    private static func getUniqueId()->Int{
        idFactory += 1
        return idFactory
    }
}



 //MARK:  Extension

extension Collection{
    
    // count and first are colleciton methods of the Collection Protocol
    var oneAndOnly: Element?{
        return count == 1 ? first : nil
    }
}
