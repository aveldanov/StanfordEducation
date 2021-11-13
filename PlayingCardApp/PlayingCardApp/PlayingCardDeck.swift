//
//  PlayingCardDeck.swift
//  PlayingCardApp
//
//  Created by Anton Veldanov on 11/7/21.
//

import Foundation


struct PlayingCardDeck{
    
    private (set) var cards = [PlayingCard]()
    
    init(){
        for suit in PlayingCard.Suit.all{
            for rank in PlayingCard.Rank.all{
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw()->PlayingCard?{
        
        let randomIndex = Int.random(in: 0..<cards.count)
        if cards.count > 0{
            return cards.remove(at: randomIndex)
        }else{
            return nil
        }
    }
}
