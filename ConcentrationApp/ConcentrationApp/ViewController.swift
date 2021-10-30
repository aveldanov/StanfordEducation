//
//  ViewController.swift
//  ConcentrationApp
//
//  Created by Anton Veldanov on 10/29/21.
//

import UIKit

class ViewController: UIViewController {


    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "flips: \(flipCount)"
        }
    }
    var emojiChoices: [String] = ["👻","🎃","👽","💩","🤡","😈","💀","👺"]
    
    var emojiDict = [Int: String]()
    
    lazy var game: Concentration = Concentration(numberOfPairOfCards: (cardButtons.count+1)/2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
     //MARK: Actions
   
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
           
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("card", cardNumber)

//            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("No Such Card")
        }
    }
    
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
                button.setTitleColor(.red, for: .normal)
            }else{
                button.setTitle("", for: .normal)
                button.titleLabel?.text = ""
                button.backgroundColor = card.isMatched ? UIColor.white : UIColor.orange
            }
        }
    }
    
    
    
    
    func emoji(for card: Card)->String{
        return emojiDict[card.id] ?? "?"
    }

    
}



