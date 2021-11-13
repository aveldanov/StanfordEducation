//
//  ViewController.swift
//  PlayingCardApp
//
//  Created by Anton Veldanov on 11/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10{
            if let card = deck.draw(){
                print(card)
            }
        }
    }
}

