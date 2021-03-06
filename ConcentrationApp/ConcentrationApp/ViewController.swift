//
//  ViewController.swift
//  ConcentrationApp
//
//  Created by Anton Veldanov on 10/29/21.
//

import UIKit

class ViewController: UIViewController {


    private(set) var flipCount = 0 {
        didSet{
//            flipCountLabel.text = "flips: \(flipCount)"
            
            updateFlipCountLabel()
            
        }
    }
//    private var emojiChoices: [String] = ["π»","π","π½","π©","π€‘","π","π","πΊ","π","π€","β οΈ","πΉ"]
    private var emojiChoices: String = "π»ππ½π©π€‘πππΊππ€β οΈπΉ"
    private var emojiDict = [Card: String]()
    
    var numberOfPairOfCards: Int {
        return (cardButtons.count+1)/2
    }
    
    
    private lazy var game: Concentration = Concentration(numberOfPairOfCards: numberOfPairOfCards)
    
    @IBOutlet weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }
    @IBOutlet weak var button: UIButton!
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(Int.random(in:0..<emojiChoices.count))
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
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        resetUI()
        
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
                button.setTitleColor(.red, for: .normal)
            }else{
                button.titleLabel?.text = ""
                button.setTitle("", for: .normal)
//                print("Matched?",card.isMatched)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    
    private func emoji(for card: Card)->String{
        if emojiDict[card] == nil, emojiChoices.count > 0{
//            let randomIndex = Int.random(in: 0..<emojiChoices.count)
            let randomIndex = emojiChoices.count.randomInteger

            print("Random Index",randomIndex)
            
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: randomIndex)
            //remove emoji at index, so we won't use it again
            
            emojiDict[card] = String(emojiChoices.remove(at: randomStringIndex))
        }//            let randomIndex = Int.random(in: 0..<emojiChoices.count)

        
        return emojiDict[card] ?? "?"
    }
    
    func resetUI(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            button.backgroundColor = .orange
            button.setTitle("", for: .normal)
            button.titleLabel?.text = ""
        }
        flipCount = 0
        emojiDict = [Card:String]()
//        emojiChoices = ["π»","π","π½","π©","π€‘","π","π","πΊ","π","π€","β οΈ","πΉ"]
        
        emojiChoices = "π»ππ½π©π€‘πππΊππ€β οΈπΉ"
        game = Concentration(numberOfPairOfCards: numberOfPairOfCards)
    }
    
     //MARK: Helpers
    
    private func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key: Any] = [.strokeWidth :5.0,
                                                            .strokeColor: UIColor.systemOrange]
        let attributedString = NSAttributedString(string: "flips: \(flipCount)", attributes: attributes)
        
        flipCountLabel.attributedText = attributedString
        
    }
    
    
    
}




 //MARK: Extensions

extension Int{
    var randomInteger: Int{
        return Int.random(in: 0..<self)
    }
}


