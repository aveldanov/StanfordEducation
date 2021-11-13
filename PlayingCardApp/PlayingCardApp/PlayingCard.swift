//
//  PlayingCard.swift
//  PlayingCardApp
//
//  Created by Anton Veldanov on 11/7/21.
//

import Foundation

struct PlayingCard: CustomStringConvertible{
    var description: String{
        return "\(rank) \(suit)"
    }
    
    let suit: Suit
    let rank: Rank
    
    
    enum Suit: String, CustomStringConvertible{
        var description: String{
            return rawValue
        }
        
        case spades = "♠️"
        case clubs = "♣️"
        case diamonds = "♦️"
        case hearts = "❤️"
        
        static var all: [Suit] = [.spades,.clubs,.diamonds,.hearts]
    }
    
    
    enum Rank: CustomStringConvertible{
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order:Int {
            switch self {
            case .ace:
                return 1
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            case .numeric(let pips):
                return pips
            default:
                return 0
            }
        }
        
        static var all: [Rank]{
            var allRanks: [Rank] = [.ace]
            
            for pip in 2...10{
                allRanks.append(.numeric(pip))
            }
            allRanks+=[.face("J"), .face("Q"),.face("K")]
            return allRanks
        }
        
        
        var description: String{
            switch self{
            case .ace:
                return "A"
            case .numeric(let pips):
                return String(pips)
            case .face(let kind):
                return kind
            }
        }
        
    }
    
    
}





