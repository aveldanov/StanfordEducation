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
    var emojiChoices: [String] = ["👻","🎃","👻","💩"]
    
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

            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
    }
    
 
    


    func flipCard(withEmoji emoji: String?, on button: UIButton){

        if button.titleLabel?.text == emoji{
            print("MATCH")
            button.setTitle("", for: .normal)
            button.titleLabel?.text = ""
            button.backgroundColor = .orange
        }else{
            print("NOT MATCH", button.titleLabel?.text)

            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.red, for: .normal)
        }

    }




    

    
}

